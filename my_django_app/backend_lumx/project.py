import requests
import json
import enum

class Project():

    def __init__(self):
        pass

    def generate_apikey(self, blockchain):
        url = "https://protocol-sandbox.lumx.io/v2/projects/auth"
        payload = {
            "name": "first_commit",
            "blockchainName": f"{blockchain}"
        }
        headers = {"Content-Type": "application/json"}

        response = requests.request("POST", url, json=payload, headers=headers)
        response_dict = json.loads(response.text) #str -> dict
        self.apiKey = response_dict['apiKey']
        self.createdAt = response_dict['createdAt']
        
        print(f"\ngenerate_apikey function log:\n{json.dumps(response_dict, indent=len(response_dict))}")


    #***********************CONTRACT METHODS***********************:

    def deploy_contract(self, contract):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{contract.contractId}/deploy"
        headers = {"Authorization": f"Bearer {self.apiToken}"}
        response = requests.request("POST", url, headers=headers)
        response_dict = json.loads(response.text) #str -> dict
        print(f"\ndeploy_contract function log:\n{json.dumps(response_dict, indent=len(response_dict))}")

    def update_contract(self, contract, name, symbol, description):
        url = f"https://protocol-sandbox.lumx.io/v2/contracts/{contract.contractId}"

        payload = {
            "name": f"{name}",
            "symbol": f"{symbol}",
            "description": f"{description}",
        }
        headers = {
            "Authorization": f"Bearer {self.apiToken}",
            "Content-Type": "application/json"
        }

        response = requests.request("PATCH", url, json=payload, headers=headers)
        response_dict = json.loads(response.text) #str -> dict
        print(f"\nupdate_contract function log:\n{json.dumps(response_dict, indent=len(response_dict))}")


    #***********************TRANSACTION METHODS***********************:
    def mint_tokens(self, wallet, quantity, token):
        url = "https://protocol-sandbox.lumx.io/v2/transactions/mints"
        payload = {
            "contractId": f"{token.contract.contractId}",
            "walletId": f"{wallet.walletId}",
            "quantity": quantity,
            "uriNumber": token.uriNumber
        }
        headers = {
            "Authorization": f"Bearer {self.apiKey}",
            "Content-Type": "application/json"
        }
        response = requests.request("POST", url, json=payload, headers=headers)
        response_dict = json.loads(response.text)

        print(f"\nmint_tokens function log:\n{json.dumps(response_dict, indent=len(response_dict))}")
        self.logId = response_dict["logId"]

    def transfer_tokens(self, contract, from_, to_, token):
        url = "https://protocol-sandbox.lumx.io/v2/transactions/transfers"

        payload = {
            "contractId": f"{contract.contractId}",
            "from": f"{from_}",
            "to": f"{to_}",
            "tokenId": f"{token}"
        }
        headers = {
            "Authorization": f"Bearer {self.project.apiKey}",
            "Content-Type": "application/json"
        }
        response = requests.request("POST", url, json=payload, headers=headers)
        response_dict = json.loads(response.text)
        print(f"\ntransfer_tokens function log:\n{json.dumps(response_dict, indent=len(response_dict))}")
         
    def read_all_wallets(self):
        url = "https://protocol-sandbox.lumx.io/v2/wallets"
        headers = {"Authorization": f"Bearer {self.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        response_dict = json.loads(response.text)
        print(f"\read_all_wallets function log:\n{json.dumps(response_dict, indent=len(response_dict))}")
        return response_dict
        
    def read_all_contracts(self):
        url = "https://protocol-sandbox.lumx.io/v2/contracts"
        headers = {"Authorization": f"Bearer {self.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        response_dict = json.loads(response.text)
        print(f"\read_all_contracts function log:\n{json.dumps(response_dict, indent=len(response_dict))}")
        return response_dict

    

