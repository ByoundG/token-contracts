pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "../utils/Lockable.sol";


/// @title ExampleLockToken that uses BasicToken and Lockable.
contract ExampleLockToken is StandardToken, Lockable {

    /// @dev Constructor that sets the details of the ERC20 token.
    function ExampleLockToken() public {
        balances[msg.sender] = 1000;
    }

    /**
     * @dev transfer token for a specified address when is not locked
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

    /**
    * @dev Transfer tokens from one address to specified address when is not locked
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value)
        public
        whenNotLocked
        returns (bool)
    {
        require(super.transferFrom(_from, _to, _value));
        return true;
    }
}
