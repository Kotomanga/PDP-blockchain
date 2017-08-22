var Web3 = require("web3");

var contract = require("truffle-contract");

// var productArtifact = require("./build/contracts/Product.json");
// var Product = contract(productArtifact);


var productHistoryArtifact = require("./build/contracts/ProductHistory.json");
var ProductHistory = contract(productHistoryArtifact);




// var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

// web3.eth.defaultAccount = web3.eth.accounts[0];

ProductHistory.setProvider(new Web3.providers.HttpProvider("http://localhost:8545"));

// var contract_address = '0xbff253ac1421a10ab34721967ec8782104211b9b';

// Fetching Account details
 // console.log(Account.currentProvider);
 var web3  = new Web3(ProductHistory.currentProvider);


 var account1 = web3.eth.accounts[0];
 var account2 = web3.eth.accounts[1];
 var account3 = web3.eth.accounts[2];

	web3.eth.defaultAccount = account1; 

 // console.log(web3.eth.defaultAccount);
// console.log("Initial Balance");

// web3.eth.defaultBlock = 29;

var instance;

ProductHistory.deployed()
	.then((deployment) => {  instance = deployment; return instance.uploadProduct.sendTransaction("abc", {from: account1}); })
	.then((tx) => instance.getHistory("abc",0))
	.then((tx) => { console.log(tx); return instance.transferTo.sendTransaction("abc", account2, {from : account1}) })
	.then((tx) => instance.getHistory("abc",0))
	// .then((result) => {console.log(result); return instance.getHistory("abc",1);})
	.then((result) => console.log(result))
	// .then((tx) => console.log(tx))
	.catch(function(err){ console.log(err)});
	// .then((tx) => instance.getHistory(1))
	// .then(() => console.log)
	// .catch((err) => console.log);

	// return ins.transferTo.sendTransaction(1, account2, {from : account1});
// .then(function(tx){
// 	console.log(tx);
// });
// .then(function(tx) {
// 	console.log(tx);
// });
// Account.deployed().then(function(deploy){
// 	deployment = deploy;
// 	console.log("Depositing Money");
// 	return deployment.deposit(1000, {from : account1});
// }).then(function(tx){
// 	console.log(tx);
// 	console.log("Querying Balance");
// 	return deployment.getBalance();
// }).then(function(tx){
// 	console.log(tx);
// 	console.log("Withdrawing 1900");
// 	return deployment.withdraw(1900,{from: account1});
// }).then(function(tx){
// 	console.log(tx);
// 	console.log("Querying Balance");
// 	return deployment.getBalance();
// }).then(function(tx){
// 	console.log(tx);
// });

// // Deposit Account details
// console.log("Depositing 1000");
// Account.deployed().then(function(deploy){
// 	return deploy.deposit(1000);
// }).then(function(tx){
// 	console.log(tx);
// // return deployment.deposit(100);
// });

// // Withdraw Account details
// Account.deployed().then(function(deploy){
// 	return deploy.withdraw(1900);
// }).then(function(tx){
// 	console.log(tx);
// // return deployment.deposit(100);
// });



