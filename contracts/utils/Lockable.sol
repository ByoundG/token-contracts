pragma solidity 0.4.18;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Lockable
 * @dev Base contract which allows children to implement a lock mechanism.
 */
contract Lockable is Ownable {
    event UnLock();

    bool public locked = true;

    /**
    * @dev Modifier to make a function callable only when the contract is not locked.
    */
    modifier whenNotLocked() {
      require(!locked);
      _;
    }

    /**
    * @dev called by the owner to release, returns to normal state
    */
    function Release() onlyOwner {
      locked = false;
      UnLock();
    }

}
