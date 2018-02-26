pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import "./utils/TokenControllerI.sol";


/**
 * @title Controllable ERC20 token
 *
 * @dev Token that queries a token controller contract to check if a transfer is allowed.
 */
contract ControllableToken is Ownable, StandardToken {
    TokenControllerI public controller;

    modifier isAllowed(address _from, address _to) {
        require(controller != address(0));
        require(controller.transferAllowed(_from, _to));
        _;
    }

    function setController(address _controller) onlyOwner public {
        require(_controller != 0);
        controller = controller;
    }

    function transfer(address _to, uint256 _value) isAllowed(msg.sender, _to) public returns (bool) {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) isAllowed(_from, _to) public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}
