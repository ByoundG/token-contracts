pragma solidity 0.4.19;

import "../ControllableToken.sol";


contract ControllableTokenMock is ControllableToken {

    function ControllableTokenMock(address initialAccount, uint256 initialBalance) public {
        balances[initialAccount] = initialBalance;
        totalSupply_ = initialBalance;
    }

}
