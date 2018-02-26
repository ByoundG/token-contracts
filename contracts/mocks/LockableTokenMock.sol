pragma solidity 0.4.19;

import "../LockableToken.sol";


contract LockableTokenMock is LockableToken {

  function LockableTokenMock(address initialAccount, uint256 initialBalance) public {
    balances[initialAccount] = initialBalance;
    totalSupply_ = initialBalance;
  }

}
