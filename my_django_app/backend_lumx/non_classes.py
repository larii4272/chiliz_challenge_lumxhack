import requests
import json

def invoke_custom_transaction(outsideContractAddress, functionSignature, argumentsValues, messageValue, walletId, apiKey):
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
        "Authorization": f"Bearer {apiKey}",
        "Content-Type": "application/json"
    }
    response = requests.request("POST", url, json=payload, headers=headers)
    response_dict = json.loads(response.text)
    print(f"\ninvoke_custom_transaction response text {json.dumps(response_dict, indent=len(response_dict))}")
    transactionId = response_dict["id"]
    return transactionId

def read_transaction(apiKey,transactionId):
    url = f"https://protocol-sandbox.lumx.io/v2/transactions/{transactionId}"
    headers = {"Authorization": f"Bearer {apiKey}"}
    response = requests.request("GET", url, headers=headers)
    response_dict = json.loads(response.text)
    print(f"Reading transaction {json.dumps(response_dict, indent=len(response_dict))}")
    return response_dict

