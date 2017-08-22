pragma solidity ^0.4.10;

/**
 * This contract does this and that...
 */

import "./Owner.sol";
import "./Product.sol";


contract Marketplace {



	mapping(address => Owner) owners;

	address internal marketplaceId;

	mapping(string => Product) products;

	function Marketplace () {
		marketplaceId = msg.sender;
	}	

	function addNewOwner(address _ownerId, string _ownerName, bytes32 _ownerType) {
		if(!owners[_ownerId].id) {
			owners[_ownerId] = Owner(_ownerId, _ownerName, _ownerType);
			return true;
		} 
		return false;
	}
	
	function addProduct(string _prodId, string _prodName, uint _price, address _ownerId) returns (bool _success) {

		if(!products[_prodId] && owners[_ownerId]) {
			products[_prodId] = Product(_prodId, _prodName, _price, owners[_ownerId]);
			return true;
		}
		return false;

	}

	function transferProduct(string _prodId, address _owner, address _newOwner) returns(bool _transferred) {
		if(products[_prodId].currentOwner.id == _owner) {
			products[_prodId].transferTo(_newOwner);
			return true;
		}
		return false;
	}
	function getProductHistory(string _prodId) returns (string _pId, string _pName, uint _pPrice, address _oId, string _oName, bytes32 _oType) {
		Product p = products[_prodId];
		Owner o = owners[_prodId];

		if(p) {
			return (p.prodId, p.prodName, p.price, p.currentOwner, o.name, o.owerType);
		}
	}
}

