We have two type of transactions here:
1. `[Normal transaction]`, where we send cryptocurrency (Ether) from one account to another.
2. `[Contract transaction]`, where we can create a class like structure to perform certain actions and events and add this to blockchain.

This contract transaction have a potental for creating blockchain what we require for our ecommerce usecase. 

For testing purpose ethereum provide private network of nodes, which can be downloaded as a software, like `testrpc` or we can create or own private distributed network across different systems using `geth` [Ethereum client].

Each node will have a copy of entire blockchain and there will be specific nodes which we call as miner, a potential node for validating and adding new block into blockchain.

For accessing these nodes Ethereum provides client implementaion in different languages like `Go, python, node etc`.

Next, We have `truffle` i.e., a framework for contract management and automating the process of compiling and deploying contracts to blockchain.

Help me progress further.



Ecommerce Use case

All the stakeholders (supplier, manufacturer, vendor except customer) will be a part of the blockchain.

1. Multiple manufacturer will add the product to the blockchain.
2. Vendor will purchase the product from manufacturer and add this transaction to blockchain.
3. End customer will be able to track the entire product history before purchasing it and will ensure trust on product.

