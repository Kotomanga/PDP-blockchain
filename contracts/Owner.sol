pragma solidity ^0.4.10;

/**
 * 
 */
contract Owner {

	address public id;
	string public name;
	
	// enum OwnerType { Vendor, Manufacturer, Customer}
	bytes32 owerType;
	

	function Owner (address _id, string _name, bytes32 _type) {
		id = _id;
		name = _name;
		owerType = _type;
	}
}
