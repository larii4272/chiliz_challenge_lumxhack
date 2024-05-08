## Detalhe Técnico

### Contrato AuctionCrypto

O contrato AuctionCrypto é uma implementação em Solidity de um sistema de leilão e criação de tokens ERC721. Ele permite a criação e gerenciamento de leilões para itens específicos, bem como a criação e compra de tokens.

### Funcionalidades Principais:
+ function withdraw():
Função para o proprietário do contrato retirar os fundos acumulados no contrato.
+ function createAuction():
- Permite a criação de um novo leilão para um item específico.
- O criador do leilão pode especificar o nome, preço inicial e duração do leilão.
- O item a ser leiloado é representado por um token ERC721.
+ function bid():
- Usada pelos licitantes para fazer lances em um leilão.
- Eles devem fornecer uma quantia de Ether maior do que o lance atual mais alto.
+ function endAuction():
- Encerra um leilão depois que o tempo de duração especificado expira.
- Determina o licitante vencedor e transfere o item leiloado para ele.
+ function getAllAuctions():
- Retorna uma lista de todos os itens atualmente em leilão.
+ function getOwnerAuction(): 
- Retorna uma lista de todos os itens em leilão que pertencem a um determinado endereço de carteira.
+ function createToken():
- Permite a criação de um novo token ERC721.
- O proprietário do contrato pode especificar o nome, valor inicial e metadados do token.
+ function purchaseToken():
- Usada para comprar um token ERC721 disponível.
- O comprador deve fornecer o valor especificado e recebe o token após a compra.
+ function getAllTokens():
- Retorna uma lista de todos os tokens ERC721 criados.
+ function getOwnerTokens():
- Retorna uma lista de todos os tokens ERC721 que pertencem a um determinado endereço de carteira.


## Technical Detail

### AuctionCrypto Contract

The AuctionCrypto contract is a Solidity implementation of an auction and ERC721 token creation system. It allows the creation and management of auctions for specific items, as well as the creation and purchase of ERC721 tokens.

### Key Features:
+ `withdraw()` function:
  - Allows the contract owner to withdraw accumulated funds from the contract.
+ `createAuction()` function:
  - Allows the creation of a new auction for a specific item.
  - The auction creator can specify the name, starting price, and duration of the auction.
  - The item being auctioned is represented by an ERC721 token.
+ `bid()` function:
  - Used by bidders to place bids on an auction.
  - They must provide an amount of Ether greater than the current highest bid.
+ `endAuction()` function:
  - Ends an auction after the specified duration time expires.
  - Determines the winning bidder and transfers the auctioned item to them.
+ `getAllAuctions()` function:
  - Returns a list of all items currently in auction.
+ `getOwnerAuction()` function:
  - Returns a list of all items in auction belonging to a specific wallet address.
+ `createToken()` function:
  - Allows the creation of a new ERC721 token.
  - The contract owner can specify the name, initial value, and metadata of the token.
+ `purchaseToken()` function:
  - Used to purchase an available ERC721 token.
  - The buyer must provide the specified value and receives the token after purchase.
+ `getAllTokens()` function:
  - Returns a list of all created ERC721 tokens.
+ `getOwnerTokens()` function:
  - Returns a list of all ERC721 tokens belonging to a specific wallet address.
