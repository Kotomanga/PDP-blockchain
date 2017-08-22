pragma solidity ^0.4.11;

 contract Product {
 	
 	string prodId;
 	string prodName;
 	uint price;
 	address currentOwner;
 	address[] transferHistory;

 	function Product(string _prodId, string _prodName, uint _price, address _currOwner) {
 		prodId = _prodId;
 		prodName = _prodName;
 		price = _price;
 		currentOwner = _currOwner;
 	}
 	function transferTo(address _to) returns (bool _success) {
 		if(currentOwner == msg.sender) {
 			transferHistory.push(currentOwner);
 			currentOwner = _to;
 		}
 	}
 }