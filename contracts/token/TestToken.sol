pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "../utils/UnlimitedMintableToken.sol";
import './ERC223BasicToken.sol';

/// @title TestToken that uses UnlimitedMintableToken, DetailedERC20, ERC223BasicToken.
contract TestToken is DetailedERC20, UnlimitedMintableToken, ERC223BasicToken {
    string constant NAME = "Test";
    string constant SYMBOL = "T";
    uint8 constant DECIMALS = 18;

    /// @dev Constructor that sets the details of the ERC20 token.
    function TestToken()
        DetailedERC20(NAME, SYMBOL, DECIMALS)
        public
    {}
}
