pragma solidity ^0.4.10;

contract ProductHistory {

	struct Vendor{
		address vendorId;
		string vendorName;

	}
	struct HistoryDetail{
		address currentOwnerId;
		string vendorName;
		address[] previusOwners;
	}

	mapping (string => HistoryDetail) historyMap;

	mapping (bytes32 => bytes32[]) public history;

	function uploadProduct(string _prodId, string vendorName) {

		historyMap[_prodId].currentOwnerId = msg.sender;
		historyMap[_prodId].vendorName = vendorName;

	}
	function transferTo(string _prodId, address _to) returns (bool successful) {
		if(historyMap[_prodId].currentOwnerId == msg.sender) { // Owner is authorized to transfer asset
			historyMap[_prodId].previusOwners.push(msg.sender);
			historyMap[_prodId].currentOwnerId = _to;
			return true;
		}

		return false;

	}

	function getHistory(string _prodId, uint i)  constant returns (address his) {
		// uint size = history[_prodId].length;

		// return history[_prodId][size-1-i];

		uint size = historyMap[_prodId].previusOwners.length;
		if(i==0) 
		return historyMap[_prodId].currentOwnerId;
		else {

			return historyMap[_prodId].previusOwners[size-i];
		}
	}

	// function getUser(uint index) public constant returns(uint, string, string, uint) {
		//      return (users[index].salaryId, users[index].name, users[index].userAddress, users[index].salary);
		//  }
	}