pragma solidity 0.4.19;

import "../ERC223BasicToken.sol";


contract ERC223BasicTokenMock is ERC223BasicToken {

  function ERC223BasicTokenMock(address initialAccount, uint256 initialBalance) public {
    balances[initialAccount] = initialBalance;
    totalSupply_ = initialBalance;
  }

}
