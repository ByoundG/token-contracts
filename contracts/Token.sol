pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";

import "./ControllableToken.sol";


contract Token is ControllableToken, DetailedERC20 {

    function Token(
        string _name,
        string _symbol,
        uint8 _decimals,
        uint256 _supply
    ) DetailedERC20(_name, _symbol, _decimals) {
        totalSupply_ = _supply;
        balance[this] = _supply;
        Transfer(address(0), this, _supply);
    }
}
