var Web3 = require("web3");

var contract = require("truffle-contract");

// var productArtifact = require("./build/contracts/Product.json");
// var Product = contract(productArtifact);


var MarketplaceArtifact = require("./build/contracts/Marketplace.json");
var Marketplace = contract(MarketplaceArtifact);




// var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

// web3.eth.defaultAccount = web3.eth.accounts[0];

Marketplace.setProvider(new Web3.providers.HttpProvider("http://localhost:8545"));

// var contract_address = '0xbff253ac1421a10ab34721967ec8782104211b9b';

// Fetching Account details
 // console.log(Account.currentProvider);
 var web3  = new Web3(Marketplace.currentProvider);


 var accounts = {
 	'marketplace' : web3.eth.accounts[0],
 	'manufacturer' : {
 		'apple' : web3.eth.accounts[1],
 		'samsung' : web3.eth.accounts[2]
 	},
 	'vendors' : {
 		'apple_retail': web3.eth.accounts[3],
 		'samsung_retail': web3.eth.accounts[4]
 	}
 };

 // web3.eth.defaultAccount = accounts.marketplace; 

 var marketplaceInstance;

// Do some intial setu

Marketplace.deployed()
	.then((deployed) => marketplaceInstance = deployed)
	// .then((i) => marketplaceInstance.addNewOwner(accounts.vendors.apple_retail, 'Apple Retail', 'Vendor'))
	// .then((i) => marketplaceInstance.addNewOwner(accounts.vendors.samsung_retail, 'Samsung Retail', 'Vendor'))
	//  Add Some Products
	// .then((i) => marketplaceInstance.addProduct("prod1", 'Apple iPhone 6s', 35000, accounts.manufacturer.apple))
	.then(() => marketplaceInstance.addProduct.sendTransaction("prod2", 'Apple iPhone 7', 55000, accounts.manufacturer.apple, {from : web3.eth.accounts[0]}))
	// .then((i) => marketplaceInstance.addProduct("prod3", 'Samsung Galaxy 6s', 53000, accounts.manufacturer.samsung))
	.then((res) => console.log(res))
	.catch((err) => console.log(err));
