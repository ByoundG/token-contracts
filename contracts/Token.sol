pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

import "./LockableToken.sol";
import "./ControllableToken.sol";


contract Token is ControllableToken, DetailedERC20 {

}
