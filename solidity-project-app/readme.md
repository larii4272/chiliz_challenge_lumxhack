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

## Como Usar

Para utilizar o contrato AuctionCrypto, siga estas etapas:

1. **Deploy do Contrato**: Implante o contrato na blockchain Ethereum utilizando uma plataforma de sua escolha, como Remix, Truffle ou execute este projeto no Foundry.

### Exemplo de como executar o Deploy na rede chiliz
`forge script script/AuctionCrypto.s.sol:AuctionCryptoScript --rpc-url chiliz --broadcast`

2. **Interagir com o Contrato**: Utilize uma carteira Ethereum compatível, como MetaMask, para interagir com o contrato. Isso inclui criar novos leilões, fazer lances em leilões existentes, criar tokens e comprar tokens disponíveis.

3. **Gerenciar Transações**: Ao participar de leilões ou comprar tokens, assegure-se de possuir saldo suficiente em sua carteira Ethereum. Além disso, esteja ciente das taxas associadas às transações, incluindo taxas de gás e taxas de serviço do contrato.

4. **Monitorar Atividades**: Acompanhe os eventos emitidos pelo contrato para monitorar a atividade dos leilões e transações de tokens. Isso inclui eventos como a criação de novos leilões, lances em leilões, encerramento de leilões e compra de tokens.

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

  ## How to Use

To utilize the AuctionCrypto contract, follow these steps:

1. **Deploy the Contract**: Deploy the contract on the Ethereum blockchain using a platform of your choice, such as Remix, Truffle, or run this project on Foundry.

   #### Example of how to deploy on the chiliz network
   `forge script script/AuctionCrypto.s.sol:AuctionCryptoScript --rpc-url chiliz --broadcast`

2. **Interact with the Contract**: Use a compatible Ethereum wallet, such as MetaMask, to interact with the contract. This includes creating new auctions, placing bids on existing auctions, creating tokens, and purchasing available tokens.

3. **Manage Transactions**: When participating in auctions or purchasing tokens, ensure you have a sufficient balance in your Ethereum wallet. Also, be aware of the associated transaction fees.

4. **Monitor Activities**: Keep track of events emitted by the contract to monitor auction and token transaction activity. This includes events such as the creation of new auctions, bids on auctions, auction closure, and token purchases.

