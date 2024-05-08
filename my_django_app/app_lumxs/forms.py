# forms.py
from django import forms
from django.db import models
from django.forms import ModelForm, TextInput, NumberInput
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from app_lumxs.models import CustomUser, Wallet, Transaction, SolidityToken
from backend_lumx import project, non_classes
import json
from django.core.validators import MinLengthValidator



class LoginForm(AuthenticationForm):
    username = forms.CharField(label="Username",max_length=20)
    password = forms.CharField(label='Password', max_length=40, widget=forms.PasswordInput())
    class Meta:
        model = CustomUser
        fields = ['username', 'password']

# Form to Edit Number of Pills for an Elder
class EditTokensForm(forms.Form):    
    def __init__(self, user, *args, **kwargs):
        super(EditTokensForm, self).__init__(*args, **kwargs)
        elder_pills = user.elder.medicinebox_set.all()
        for pill in elder_pills:
            self.fields[pill.pills.name] = forms.IntegerField(initial=pill.number_of_pills, min_value=0)
            


#********************API Functions Communicating with Solidity****************************

# Create Token: 
path_createtoken = "./sol_contracts/create_solidity_token.json"

class SolidityCreateToken(forms.Form):
    metadata = forms.CharField(max_length=1000)
    name = forms.CharField(max_length=100)
    tokenValue = forms.IntegerField()
    tokenId = forms.IntegerField()
    wallet = forms.ModelChoiceField(queryset=Wallet.objects.all())  # Use ModelChoiceField para selecionar um objeto Wallet
    #user = forms.ModelChoiceField(queryset=CustomUser.objects.all())
    def save(self, *args, **kwargs):

        with open(path_createtoken, 'r') as file:
            create_token = json.load(file)

        walletInstance = self.cleaned_data['wallet']  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        print("\nBelow api_key")  
        print(f"create_token json {create_token}")
        
        user_instance = walletInstance.user
        apiKeyInstance = user_instance.apiKey

        transactionId = non_classes.invoke_custom_transaction(create_token['outsideContractAddress'], create_token['functionSignature'],
                                              [self.cleaned_data['metadata'], self.cleaned_data['name'], self.cleaned_data['tokenValue'], self.cleaned_data['tokenId']], 
                                              create_token['messageValue'], walletIdInstance, apiKeyInstance)
        transactionName = self.cleaned_data['name']
        # Criar uma instância do modelo Transaction e salvá-la
        transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName=transactionName)
        transaction_instance.save()
        solidity_token = SolidityToken(metadata=self.cleaned_data['metadata'], name=self.cleaned_data['name'], tokenValue=self.cleaned_data['tokenValue'],tokenId=self.cleaned_data['tokenId'])
        solidity_token.save()


# Create Auction
path_createauction = "./sol_contracts/create_solidity_auction.json"
class CreateSolidityAuction(forms.Form):
    metadata = forms.CharField(max_length=1000)
    name = forms.CharField(max_length=100)
    tokenValue = forms.IntegerField(max_value=100)
    days = forms.IntegerField()
    wallet = forms.ModelChoiceField(queryset=Wallet.objects.all())  # Use ModelChoiceField para selecionar um objeto Wallet
    #user = forms.ModelChoiceField(queryset=CustomUser.objects.all())
    def save(self, *args, **kwargs):

        with open(path_createauction, 'r') as file:
            createauction = json.load(file)

        walletInstance = self.cleaned_data['wallet']  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        print("\nBelow api_key")  
        
        user_instance = walletInstance.user
        apiKeyInstance = user_instance.apiKey
        transactionId = non_classes.invoke_custom_transaction(createauction['outsideContractAddress'], createauction['functionSignature'],
                                              [self.cleaned_data['metadata'], self.cleaned_data['name'], self.cleaned_data['tokenValue'], self.cleaned_data['days']], 
                                              createauction['messageValue'], walletIdInstance, apiKeyInstance)
        transactionName = self.cleaned_data['name']
        # Criar uma instância do modelo Transaction e salvá-la
        transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName=transactionName)
        transaction_instance.save()

path_purchasetoken = "./sol_contracts/purchase_solidity_token.json"
class PurchaseSolidityToken(forms.Form):

    myToken = forms.ModelChoiceField(queryset=SolidityToken.objects.all())
    #tokenId = forms.IntegerField()
    wallet = forms.ModelChoiceField(queryset=Wallet.objects.all())  # Use ModelChoiceField para selecionar um objeto Wallet
    #user = forms.ModelChoiceField(queryset=CustomUser.objects.all())
    def save(self, *args, **kwargs):

        with open(path_purchasetoken, 'r') as file:
            purchasetoken = json.load(file)

        myTokenInstance = self.cleaned_data['myToken']
        tokenId = myTokenInstance.tokenId
        tokenValue = myTokenInstance.tokenValue

        walletInstance = self.cleaned_data['wallet']  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        walletUser = walletInstance.user
        walletTokens = walletInstance.walletTokens
        #user_instance = self.cleaned_data['user']
        apiKeyInstance = walletUser.apiKey

        print(f"walletTokens {walletTokens} tokenValue {tokenValue}")
        if walletTokens >= tokenValue:
            transactionId = non_classes.invoke_custom_transaction(purchasetoken['outsideContractAddress'], purchasetoken['functionSignature'],
                                                [tokenId], purchasetoken['messageValue'], walletIdInstance, apiKeyInstance)
            
            # Create an instance of the Transaction model and save it
            transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName="PurchaseSolidityToken")
            transaction_instance.save()

            # Updating walletTokens value
            walletInstance.walletTokens -= tokenValue
            walletInstance.save()
            return True
        else:
            print("Entrou no else")
            return False
            
path_purchasetoken = "./sol_contracts/purchase_solidity_token.json"
class PurchaseSolidityToken_2(forms.Form):
    # Entrando na funcao, eu pego todos atributos e jogo abaixo
    def __init__(self, token_id, wallet_id, user_id):
        # para pegar a instancia que contem os atributos eu chamo todos
        allTokens = SolidityToken.objects.all()
        allWallets = Wallet.objects.all()
        allUsers = CustomUser.objects.all()

        # depois eu varro procurando o token, wallet e usuario
        for x in allTokens:
            if(x.tokenId == token_id):
                print(x)
                self.token = x
        for x in allWallets:
            if(x.walletAddress == wallet_id):
                print(x)
                self.wallet = x
        for x in allUsers:
            if(x.username == user_id):
                print(x)
                self.user = x
    # o resto continua quase igual, só que eu pego dos self., exemplo self.user: contem a 
    # instancia do user
    def save(self, *args, **kwargs):

        with open(path_purchasetoken, 'r') as file:
            purchasetoken = json.load(file)

        myTokenInstance =self.token
        tokenId = myTokenInstance.tokenId
        tokenValue = myTokenInstance.tokenValue

        walletInstance = self.wallet  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        walletTokens = walletInstance.walletTokens
        user_instance = self.user
        apiKeyInstance = user_instance.apiKey

        print(f"walletTokens {walletTokens} tokenValue {tokenValue}")
        if walletTokens >= tokenValue:
            transactionId = non_classes.invoke_custom_transaction(purchasetoken['outsideContractAddress'], purchasetoken['functionSignature'],
                                                [tokenId], purchasetoken['messageValue'], walletIdInstance, apiKeyInstance)
            
            # Create an instance of the Transaction model and save it
            transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName="PurchaseSolidityToken")
            transaction_instance.save()

            # Updating walletTokens value
            walletInstance.walletTokens -= tokenValue
            walletInstance.save()
            return True
        else:
            print("Entrou no else")
            return False

path_getAllSolitidyToken = "./sol_contracts/get_all_solidity_tokens.json"
class GetAllSolidityToken(forms.Form):
    
    wallet = forms.ModelChoiceField(queryset=Wallet.objects.all())  # Use ModelChoiceField para selecionar um objeto Wallet
    user = forms.ModelChoiceField(queryset=CustomUser.objects.all())
    def save(self, *args, **kwargs):

        with open(path_getAllSolitidyToken, 'r') as file:
            getAllSolitidyToken = json.load(file)

        walletInstance = self.cleaned_data['wallet']  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        print("\nBelow api_key")  
        
        user_instance = self.cleaned_data['user']
        apiKeyInstance = user_instance.apiKey
        transactionId = non_classes.invoke_custom_transaction(getAllSolitidyToken['outsideContractAddress'], getAllSolitidyToken['functionSignature'],
                                              [""], 
                                              getAllSolitidyToken['messageValue'], walletIdInstance, apiKeyInstance)
    
        # Criar uma instância do modelo Transaction e salvá-la
        transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName="GetAllSolidityToken")
        transaction_instance.save()


path_getAllSolidityAuctions = "./sol_contracts/get_all_solidity_auctions.json"
class GetAllSolidityAuctions(forms.Form):
    
    wallet = forms.ModelChoiceField(queryset=Wallet.objects.all())  # Use ModelChoiceField para selecionar um objeto Wallet
    user = forms.ModelChoiceField(queryset=CustomUser.objects.all())
    def save(self, *args, **kwargs):

        with open(path_getAllSolidityAuctions, 'r') as file:
            getAllSolitidyAuctions = json.load(file)

        walletInstance = self.cleaned_data['wallet']  # Obtenha a instância de Wallet do formulário
        walletIdInstance = walletInstance.walletId
        print("\nBelow api_key")  
        
        user_instance = self.cleaned_data['user']
        apiKeyInstance = user_instance.apiKey
        transactionId = non_classes.invoke_custom_transaction(getAllSolitidyAuctions['outsideContractAddress'], getAllSolitidyAuctions['functionSignature'],
                                              [""], 
                                              getAllSolitidyAuctions['messageValue'], walletIdInstance, apiKeyInstance)
        
        # Criar uma instância do modelo Transaction e salvá-la
        transaction_instance = Transaction.objects.create(transactionId=transactionId, transactionName="GetAllSolidityAuctions")
        transaction_instance.save()


