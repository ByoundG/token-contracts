pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import '../token/ERC223BasicToken.sol';
import "../utils/EnforceProtocol.sol";


/// @title EnforceProtocolToken that uses MintableToken, DetailedERC20, ERC223BasicToken, EnforceProtocol
contract ExampleEnforceProtocolToken is DetailedERC20, MintableToken, ERC223BasicToken, EnforceProtocol {
    string constant NAME = "Enforce Protocol Token";
    string constant SYMBOL = "EPT";
    uint8 constant DECIMALS = 18;
    address public protocolAddress;
    
    /// @dev Constructor that sets the details of the ERC20 token.
    function ExampleEnforceProtocolToken(address _protocolAddress)
        EnforceProtocol(_protocolAddress)
        DetailedERC20(NAME, SYMBOL, DECIMALS)
        public
    {
        protocolAddress = _protocolAddress;
    }

    /**
     * @dev transfer token for a protocol address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     * @param _data payload to be send with the transfer.
     */
    function transfer(address _to, uint256 _value, bytes _data)
        public
        toProtocol(_to)
        returns (bool)
    {
        require(super.transfer(_to, _value, _data));
        return true;
    }

    /**
     * @dev transfer token for a protocol address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value)
        public
        toProtocol(_to)
        returns (bool)
    {
        require(super.transfer(_to, _value));
        return true;
    }

    /**
     * @dev Transfer tokens from one address to protocol address
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value)
        public
        toProtocol(_to)
        returns (bool)
    {
        require(super.transferFrom(_from, _to, _value));
        return true;
    }
}
