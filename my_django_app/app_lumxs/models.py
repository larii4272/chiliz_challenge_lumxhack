from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, AbstractUser
from django.core.exceptions import ValidationError
from backend_lumx import project, contract, wallet, token_, transaction, enums, non_classes
from django.core.validators import MinLengthValidator, MinValueValidator
import json

class CustomUserManager(BaseUserManager):
    def create_user(self, username, password=None, **extra_fields):
        if not username:
            raise ValueError('The username field must be set')
        user = self.model(username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user
    
    def create_superuser(self, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(username, password, **extra_fields)

class CustomUser(AbstractBaseUser):
    username = models.CharField(max_length=100, primary_key=True)
    apiKey = models.CharField(max_length=1500, blank=True)
    is_staff = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)

    
    objects = CustomUserManager()
    
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []
    
    def __str__(self):
        return self.username
    
    def has_module_perms(self, app_label):
        return True
    
    def has_perm(self, perm, obj=None):
        return True 
    
    def check_password(self, raw_password: str) -> bool:
        return super().check_password(raw_password)

    def save(self, *args, **kwargs):
        if not self.apiKey:  # Verificar se já tem uma apiKey
            user_project = project.Project()
            user_project.generate_apikey(enums.AccountType.CHILIZ.value)
            self.apiKey = user_project.apiKey
        super().save(*args, **kwargs)

    
class Wallet(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    walletAddress = models.CharField(max_length=100, blank=True)  
    walletId = models.CharField(max_length=100, blank=True)       
    walletTokens = models.IntegerField(default=10000, validators=[MinValueValidator(0)]) 

    def save(self, *args, **kwargs):
        
        if not self.pk:  # Verifica se é uma nova instância
            # Antes de salvar, obtenha o projeto associado ao usuário
            apiKeyinstance = self.user.apiKey   
            
            # Before saving, obtain the project associated with the user.
            wallet_instance = wallet.Wallet() 
            wallet_instance.create_wallet(apiKey=apiKeyinstance)
            
            #Use the project to create the wallet.
            self.walletAddress = wallet_instance.walletAddress
            self.walletId = wallet_instance.walletId
        super().save(*args, **kwargs)  # Salva a instância do modelo OpenWallet no banco de dados

class Contract(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    symbol = models.CharField(max_length=100, validators=[MinLengthValidator(3)])
    description = models.CharField(max_length=100)
    contractType = models.CharField(max_length=100)
    contractAddress = models.CharField(max_length=100, blank=True)  # Campo para salvar o endereço da carteira
    contractId = models.CharField(max_length=100, blank=True)       # Campo para salvar o ID da carteira

    def save(self, *args, **kwargs):
        if not self.pk:  # Verifica se é uma nova instância
            # Antes de salvar, obtenha o projeto associado ao usuário
            apiKeyinstance = self.user.apiKey    
            contract_instance = contract.Contract() 
            name = self.name 
            symbol = self.symbol
            description = self.description
            contractType = self.contractType
            # Passando os valores para o método create_contract
            contract_instance.create_contract(name, symbol, description, contractType, apiKeyinstance)
            self.contractAddress = contract_instance.contractAddress
            self.contractId = contract_instance.contractId
        super().save(*args, **kwargs)  # Salva a instância do modelo OpenWallet no banco de dados


class LumxToken(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    maxSupply = models.IntegerField()
    description = models.CharField(max_length=100)
    imageUrl = models.CharField(max_length=10000)
    def save(self, *args, **kwargs):
        # Antes de salvar, obtenha o projeto associado ao usuário
        project_instance = self.user.project   
        contract_instance = contract.Contract(project_instance) 
        name = self.cleaned_data['name']
        maxSupply = self.cleaned_data['maxSupply']
        description = self.cleaned_data['description']
        imageUrl = self.cleaned_data['imageUrl']
        # Passando os valores para o método create_contract
        contract_instance.create_token(name, description, maxSupply, imageUrl)
        self.contractAddress = contract_instance.contractAddress
        self.contractId = contract_instance.contractId
        super().save(*args, **kwargs)  # Salva a instância do modelo OpenWallet no banco de dados

class SolidityToken(models.Model):
    name = models.CharField(max_length=100)
    tokenValue = models.IntegerField()
    metadata = models.CharField(max_length=10000)
    tokenId = models.IntegerField()

class Bet(models.Model):
    player1 = models.CharField(max_length=100, blank=True)
    player2 = models.CharField(max_length=100, blank=True)

class Athlete(models.Model):
    athleteName = models.CharField(max_length=100)
    athleteId = models.IntegerField()
    imageUrl = models.CharField(max_length=10000)
    flag = models.CharField(max_length=10)
    description = models.CharField(max_length=10000)
    def clean(self):
        # Verifica se o athleteId já existe
        if Athlete.objects.filter(athleteId=self.athleteId).exists():
            raise ValidationError("Este athleteId já está em uso.")

    def save(self, *args, **kwargs):
        self.full_clean()  # Chama o método clean() antes de salvar
        super().save(*args, **kwargs)

class Experience(models.Model):
    experienceId = models.IntegerField()
    athlete = models.ForeignKey(Athlete, on_delete=models.CASCADE)
    experienceName = models.CharField(max_length=100)
    description = models.CharField(max_length=10000)
    imageUrl = models.CharField(max_length=10000)
    flag = models.CharField(max_length=10)
    price = models.IntegerField()
    def clean(self):
        # Verifica se o athleteId já existe
        if Experience.objects.filter(experienceId=self.experienceId).exists():
            raise ValidationError("Este experienceId já está em uso.")

    def save(self, *args, **kwargs):
        self.full_clean()  # Chama o método clean() antes de salvar
        super().save(*args, **kwargs)

class Transaction(models.Model):
    transactionId = models.CharField(max_length=10000)
    transactionName = models.CharField(max_length=10000)