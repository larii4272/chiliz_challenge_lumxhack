# chiliz_challenge_lumxhack

## Contrato Inteligente de Leilão e Tokens - Crypto Genius - OLY

Este contrato inteligente, desenvolvido em Solidity, oferece funcionalidades para criar leilões e tokens, facilitando a interação e transação de ativos digitais na blockchain. Pode ser implantado em qualquer EVM compatível.

## Funcionalidades

### Leilões
O contrato permite a criação e gestão de leilões de ativos digitais. Os usuários podem criar leilões especificando o nome do item, preço inicial, duração do leilão e outras informações relevantes. Durante o período do leilão, os participantes podem fazer lances, sendo o lance mais alto no final do período o vencedor do item em leilão.

### Tokens
Além dos leilões, o contrato suporta a criação e transferência de tokens digitais. Esses tokens podem representar diversos ativos, como colecionáveis, recompensas ou direitos de participação em eventos. Os usuários podem criar novos tokens e transferi-los conforme necessário.

### Pagamentos e Taxas
O contrato possibilita pagamentos em Ethereum para arrematar itens em leilões ou comprar tokens. Uma porcentagem do valor arrecadado nos leilões é retida como taxa de serviço, sendo o restante repassado ao vendedor do item. Da mesma forma, ao comprar tokens, uma parte do valor pode ser destinada ao proprietário do contrato como taxa de serviço.

## Como Usar

Para utilizar o contrato AuctionCrypto, siga estas etapas:

1. **Deploy do Contrato**: Implante o contrato na blockchain Ethereum utilizando uma plataforma de sua escolha, como Remix, Truffle ou execute este projeto no Foundry.

### Exemplo de como executar o Deploy na rede chiliz
`forge script script/AuctionCrypto.s.sol:AuctionCryptoScript --rpc-url chiliz --broadcast`

2. **Interagir com o Contrato**: Utilize uma carteira Ethereum compatível, como MetaMask, para interagir com o contrato. Isso inclui criar novos leilões, fazer lances em leilões existentes, criar tokens e comprar tokens disponíveis.

3. **Gerenciar Transações**: Ao participar de leilões ou comprar tokens, assegure-se de possuir saldo suficiente em sua carteira Ethereum. Além disso, esteja ciente das taxas associadas às transações, incluindo taxas de gás e taxas de serviço do contrato.

4. **Monitorar Atividades**: Acompanhe os eventos emitidos pelo contrato para monitorar a atividade dos leilões e transações de tokens. Isso inclui eventos como a criação de novos leilões, lances em leilões, encerramento de leilões e compra de tokens.

## Autor
Este contrato foi desenvolvido pela Equipe CryptoGenius.
Para mais informações, entre em contato com hackateam4@gmail.com.

## Equipe CryptoGenius
Dayana Mazini
UX/UI, Administradora, empreendedora com experiência no desenvolvimento de negócios inovadores nas áreas de finanças, educação e de transformação social.
LinkedIn: https://www.linkedin.com/in/dayanamazini/ 
Mazini.dayana@gmail.com

Aline Silva
Empreendedora, Atleta Olimpica, fundadora da Mempodera e da Firneza Token.
https://www.linkedin.com/in/influencer-aline-silva-oly
alinedaluta@gmail.com

Larissa Montefusco
Técnica em Eletrônica, Graduanda em Engenharia Eletrotécnica e de Computadores / Developer IoT e protocolos de comunicação, Django Python
https://www.linkedin.com/in/larissa-montefusco/
larissa.montefusco7@gmail.com

Sonia Mara Batista
Dev Blockchain, Solidity, Web3 
LinkedIn: https://www.linkedin.com/in/soniamarabatista/
dev.soniabatista@gmail.com

Matheus Oliveira
Desenvolvedor Flutter,  Fundador da Eita Rolê, empreendedor com experiência em desenvolvimento e impressão 3D.
LinkedIn: https://www.linkedin.com/in/devmatheusoliveira/
matheusoliveira.workmso@gmail.com


# Smart Auction and Tokens Contract - Crypto Genius - OLY

This smart contract, developed in Solidity, offers functionalities for creating auctions and tokens, facilitating the interaction and transaction of digital assets on the blockchain. It can be deployed on any compatible EVM.

## Features

### Auctions
The contract enables the creation and management of digital asset auctions. Users can create auctions by specifying the item name, initial price, auction duration, and other relevant information. During the auction period, participants can place bids, with the highest bid at the end of the period winning the item.

### Tokens
In addition to auctions, the contract supports the creation and transfer of digital tokens. These tokens can represent various assets such as collectibles, rewards, or participation rights in events. Users can create new tokens and transfer them as needed.

### Payments and Fees
The contract enables payments in Ethereum to bid on items in auctions or purchase tokens. A percentage of the amount raised in auctions is retained as a service fee, with the remainder passed on to the seller of the item. Similarly, when purchasing tokens, a portion of the amount may be allocated to the contract owner as a service fee.

## How to Use

To utilize the AuctionCrypto contract, follow these steps:

1. **Deploy the Contract**: Deploy the contract on the Ethereum blockchain using a platform of your choice, such as Remix, Truffle, or run this project on Foundry.

   #### Example of how to deploy on the chiliz network
   `forge script script/AuctionCrypto.s.sol:AuctionCryptoScript --rpc-url chiliz --broadcast`

2. **Interact with the Contract**: Use a compatible Ethereum wallet, such as MetaMask, to interact with the contract. This includes creating new auctions, placing bids on existing auctions, creating tokens, and purchasing available tokens.

3. **Manage Transactions**: When participating in auctions or purchasing tokens, ensure you have a sufficient balance in your Ethereum wallet. Also, be aware of the associated transaction fees.

4. **Monitor Activities**: Keep track of events emitted by the contract to monitor auction and token transaction activity. This includes events such as the creation of new auctions, bids on auctions, auction closure, and token purchases.

## Author
This contract was developed by the CryptoGenius Team.
For more information, please contact hackateam4@gmail.com.

## CryptoGenius Team


*Dayana Mazini
UX/UI, Administrator, entrepreneur with experience in developing innovative businesses in the fields of finance, education, and social transformation.
LinkedIn: https://www.linkedin.com/in/dayanamazini/ 
Mazini.dayana@gmail.com

*Aline Silva
Entrepreneur, Olympic Athlete, Founder of Mempodera and Firneza Token.
https://www.linkedin.com/in/influencer-aline-silva-oly
alinedaluta@gmail.com

*Larissa Montefusco
Electronic Technician, Undergraduate Student in Electrical and Computer Engineering / IoT Developer and Communication Protocols, Django Python
https://www.linkedin.com/in/larissa-montefusco/
larissa.montefusco7@gmail.com

*Sonia Mara Batista
Dev Blockchain, Solidity, Web3 
LinkedIn: https://www.linkedin.com/in/soniamarabatista/
dev.soniabatista@gmail.com

*Matheus Oliveira
Flutter Developer, Founder of Eita Rolê, Entrepreneur with Experience in Software Development and 3D Printing.
LinkedIn: https://www.linkedin.com/in/devmatheusoliveira/
matheusoliveira.workmso@gmail.com





