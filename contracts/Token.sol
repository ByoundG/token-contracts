pragma solidity 0.4.19;

import "./ControllableToken.sol";


contract Token is ControllableToken {

    function Token(uint256 _supply) public {
        require(_supply != 0);
        totalSupply_ = _supply;
        balances[msg.sender] = _supply;
        Transfer(address(0), this, _supply);
    }
}
