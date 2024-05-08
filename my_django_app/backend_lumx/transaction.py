import requests
import json

class Transaction():
    def __init__(self, wallet, transactionId):
        self.wallet = wallet
        self.transactionId = transactionId

    def read_transaction(self):
        url = f"https://protocol-sandbox.lumx.io/v2/transactions/{self.transactionId}"
        headers = {"Authorization": f"Bearer {self.wallet.project.apiKey}"}
        response = requests.request("GET", url, headers=headers)
        response_dict = json.loads(response.text)
        print(f"Reading transaction {json.dumps(response_dict, indent=len(response_dict))}")
        return response_dict