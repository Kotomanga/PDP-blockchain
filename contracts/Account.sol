pragma solidity ^0.4.11;

contract Account {
    mapping (address => uint) private balances;
    
    function Account(){
        balances[msg.sender] = 10000;
    }
    function transfer(address _receiver, uint _value) returns(bool _sufficient){
    	if(balances[msg.sender] < _value)
            return false;
        balances[_receiver] += _value;
        balances[msg.sender] -= _value;
        return true;
    }
    function getBalance(address _addr) constant returns(uint _balance){
        return balances[_addr];
    }
}