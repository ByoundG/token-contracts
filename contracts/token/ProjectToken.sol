pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import './ERC223BasicToken.sol';

/// @title ProjectToken that uses MintableToken, DetailedERC20, ERC223BasicToken.
contract ProjectToken is DetailedERC20, MintableToken, ERC223BasicToken {

    /// @dev Constructor that sets the details of the ERC20 token.
    function ProjectToken(string _name, string _symbol, uint8 _decimals)
        DetailedERC20(_name, _symbol, _decimals)
        public
    {}
}
