pragma solidity 0.4.23;

import "../ControllableToken.sol";


contract ControllableTokenMock is ControllableToken {

    constructor(address initialAccount, uint256 initialBalance) public {
        balances[initialAccount] = initialBalance;
        totalSupply_ = initialBalance;
    }

}
