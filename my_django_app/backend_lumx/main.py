import contract, project, wallet, token_, enums, non_classes
from enums import ContractType, AccountType
import time

if __name__ == "__main__":
    my_project = project.Project()
    my_project.generate_apikey(enums.AccountType.CHILIZ.value)
    my_wallet = wallet.Wallet(my_project)
    my_wallet.create_wallet()

    

