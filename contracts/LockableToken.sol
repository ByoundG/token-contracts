pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import "./utils/Lockable.sol";


/**
 * @title Lockable ERC20 token
 *
 * @dev Token that starts with locked transfers.
 */
contract LockableToken is StandardToken, Lockable {

    function transfer(address _to, uint256 _value) whenNotLocked public returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) whenNotLocked public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}
