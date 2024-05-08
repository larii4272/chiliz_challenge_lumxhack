
import requests
import json
from backend_lumx import transaction

class Wallet():

    def __init__(self, project=None):
        self.project = project

    def create_wallet(self, apiKey=None):
        if apiKey is None and self.project is None:
            raise ValueError("Error! We do not have enough information to do this transaction")
        elif apiKey is None:
            apiKey = self.project.apiKey
        url = "https://protocol-sandbox.lumx.io/v2/wallets"
        headers = {"Authorization": f"Bearer {apiKey}"}
        response = requests.request("POST", url, headers=headers)
        response_dict = json.loads(response.text)
        print(f"\create_wallet response text {json.dumps(response_dict, indent=len(response_dict))}")
        self.walletAddress = response_dict['address']
        self.walletId = response_dict['id']
        return response_dict
    
    def invoke_custom_transaction(self, outsideContractAddress, functionSignature, argumentsValues, messageValue, walletId=None):
        if walletId is None and self.walletId is None:
            raise ValueError("Error! We do not have enough information to do this transaction")
        elif walletId is None:
            walletId = self.walletId
        url = "https://protocol-sandbox.lumx.io/v2/transactions/custom"
        payload = {
            "walletId": f"{walletId}",
            "contractAddress": f"{outsideContractAddress}", #The contract is from outside
            "operations": [
                {
                    "functionSignature": f"{functionSignature}",
                    "argumentsValues": argumentsValues,
                    "messageValue": messageValue
                }
            ]
        }
        headers = {
            "Authorization": f"Bearer {self.project.apiKey}",
            "Content-Type": "application/json"
        }
        response = requests.request("POST", url, json=payload, headers=headers)
        response_dict = json.loads(response.text)
        print(f"\ninvoke_custom_transaction response text {json.dumps(response_dict, indent=len(response_dict))}")
        my_transaction = transaction.Transaction(self, response_dict["id"])
        return my_transaction

    #***********************READ METHODS***********************:
    def read_wallet(self):
        url = f"https://protocol-sandbox.lumx.io/v2/wallets/{self.walletId}"
        headers = {"Authorization": f"Bearer {self.project.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        print(response.text)
        response_dict = json.loads(response.text)
        return response_dict
    
    def read_all_transactions(self):
        url = "https://protocol-sandbox.lumx.io/v2/transactions"
        headers = {"Authorization": f"Bearer {self.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        print(response.text)
        response_dict = json.loads(response.text)
        return response_dict
