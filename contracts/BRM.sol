pragma solidity ^0.4.18;

import "./StandardToken.sol";

contract BRM is StandardToken {
	string public constant name = "BrahmaOS";
	string public constant symbol = "BRM";
	uint256 public constant decimals = 18;

	uint256 public constant total = 3 * 10**9 * 10**decimals;

	function BRM() {
		totalSupply = total;
		balances[msg.sender] = total;
	}
	function () public payable {
		revert();
	}
}

