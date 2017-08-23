pragma solidity ^0.4.10;

/**
 * This contract does this and that...
 */

 // import "./Owner.sol";
 // import "./Product.sol";


 contract Marketplace {


 	struct Owner {
 		address  id;
 		string  name;

 		// enum OwnerType { Vendor, Manufacturer, Customer}
 		bytes32 ownerType;
 	}
 	struct Product {
 		string prodId;
 		string prodName;
 		uint price;
 		address currentOwner;
 		// address[] transferHistory;
 	}

 	mapping(string => address[])  productHistory;

 	mapping(address => Owner) owners;

 	address internal marketplaceId;

 	mapping(string => Product) products;

 	function Marketplace () {
 		marketplaceId = msg.sender;
 	}	

 	function addNewOwner(address _ownerId, string _ownerName, bytes32 _ownerType) returns (bool _success) {
 		//if(!owners[_ownerId]) {
 			owners[_ownerId] = Owner(_ownerId, _ownerName, _ownerType);
 			return true;
 		//} 
 		//return false;
 	}

 	function addProduct(string _prodId, string _prodName, uint _price, address _ownerId) returns (bool _success) {

 		// if(!products[_prodId] && owners[_ownerId]) {
 			products[_prodId] = Product(_prodId, _prodName, _price, owners[_ownerId].id);
 			return true;
 		// }
 		// return false;

 	}

 	function transferProduct(string _prodId, address _owner, address _newOwner) returns(bool _transferred) {
 		if(products[_prodId].currentOwner == _owner) {
 			productHistory[_prodId].push(_owner);
 			// products[_prodId].transferHistory.push(_owner);
 			products[_prodId].currentOwner = _newOwner;
 			return true;
 		}
 		return false;
 	}
 	function getProductHistory(string _prodId,uint i) constant returns (string _pId, string _pName, uint _pPrice, address _oId, string _oName, bytes32 _oType) {
 		Product p = products[_prodId];
 		Owner o;
 		if(i > 0 ) {
 			uint size = productHistory[_prodId].length;
 			o = owners[productHistory[_prodId][size-i]];
 		} else {
 			o = owners[p.currentOwner];
 		}
 		// uint size = productHistory[_prodId].length;
 		//if(p) {
 			return (p.prodId, p.prodName, p.price, o.id, o.name, o.ownerType);
 		//}
 	}
 }

