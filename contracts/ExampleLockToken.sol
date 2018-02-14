pragma solidity 0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/BasicToken.sol";
import "./utils/Lockable.sol";


/// @title ExampleLockToken that uses BasicToken and Lockable.
contract ExampleLockToken is BasicToken, Lockable {

    /// @dev Constructor that sets the details of the ERC20 token.
    function ExampleLockToken()
        public
    {
      balances[msg.sender] = 1000;
    }

    /**
     * @dev transfer token for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value)
    public
    whenNotLocked
    returns (bool)
    {
      require(super.transfer(_to,_value));
      return true;
    }
}
