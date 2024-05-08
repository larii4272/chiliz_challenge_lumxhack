import requests
import json
from backend_lumx import token_

class Contract():

    def __init__(self, project=None): 
        self.project = project
        
    def create_contract(self, name, symbol, description, type_, apiKey=None):
        if apiKey is None and self.project is None :
            raise ValueError("Error! We do not have enough information to do this transaction")
        elif apiKey is None:
            apiKey = self.project.apiKey
        # Creating a contract
        url = "https://protocol-sandbox.lumx.io/v2/contracts"

        payload = {
            "name": f"{name}",
            "symbol": f"{symbol}",
            "description": f"{description}",
            "type": f"{type_}"
        }
        headers = {
            "Authorization": f"Bearer {apiKey}",
            "Content-Type": "application/json"
        }

        response = requests.request("POST", url, json=payload, headers=headers)
        print(f"\nContract created with success! {response.text}")
        response_dict = json.loads(response.text)
        self.contractId = response_dict["id"]
        self.contractAddress = response_dict["address"]
        if self.contractAddress is None:
            self.contractAddress = 0

    def create_token(self, name, description, maxSupply, imageUrl=None):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{self.contractId}/token-types"
        payload = {
            "name": f"{name}",
            "description": f"{description}",
            "maxSupply": maxSupply,
            "traits": {},
            "imageUrl": f"{imageUrl}"
        }
        headers = {
            "Authorization": f"Bearer {self.project.apiKey}",
            "Content-Type": "application/json"
        }

        response = requests.request("POST", url, json=payload, headers=headers)
        print(f"creating token on create token function {response.text}")
        response_dict = json.loads(response.text)

        tokenTypeName = response_dict["name"]
        uriNumber = response_dict["uriNumber"]
        new_token = token_.Token_(self,uriNumber, tokenTypeName)
   
    #***********************READ METHODS***********************:
    def read_token_type(self):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{self.contractId}/token-types/{self.uriNumber}"
        headers = {"Authorization": f"Bearer {self.project.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        print(response.text)

    def read_all_token_types(self):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{self.contractId}/token-types"
        headers = {"Authorization": f"Bearer {self.project.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        print(response.text)
    
    def read_contract(self, contract):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{contract.contractId}"
        headers = {"Authorization": f"Bearer {self.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        print(response.text)

