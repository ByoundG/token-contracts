pragma solidity 0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import './ERC223BasicToken.sol';

/// @title TestToken that uses MintableToken, DetailedERC20, ERC223BasicToken.
contract TestToken is DetailedERC20, MintableToken, ERC223BasicToken {
    string constant NAME = "Test";
    string constant SYMBOL = "T";
    uint8 constant DECIMALS = 18;

    /// @dev Constructor that sets the details of the ERC20 token.
    function TestToken()
        DetailedERC20(NAME, SYMBOL, DECIMALS)
        public
    {}
}
