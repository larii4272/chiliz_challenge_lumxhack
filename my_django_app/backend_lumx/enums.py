from enum import Enum

class ContractType(Enum):
    FUNGIBLE = "fungible"
    NON_FUNGIBLE = "non_fungible"

class AccountType(Enum):
    ETHEREUM = "Ethereum"
    POLYGON = "Polygon"
    CHILIZ = "Chiliz"

