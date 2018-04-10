pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "./ControllableToken.sol";


/**
 * @title Token base contract - Defines basic structure for a token
 *
 * @dev ControllableToken is a StandardToken, an OpenZeppelin ERC20 implementation library. DetailedERC20 is also an OpenZeppelin contract.
 * More info about them is available here: https://github.com/OpenZeppelin/zeppelin-solidity/tree/master/contracts/token/ERC20
 */
contract Token is ControllableToken, DetailedERC20 {

	/**
	* @dev Transfer is an event inherited from ERC20Basic.sol interface (OpenZeppelin).
	* @param _supply Total supply of tokens.
    * @param _name Is the long name by which the token contract should be known
    * @param _symbol Capital letters representing the token. Example: CVL, VPK.
    * @param _decimals Token decimals and should be between 0 and 18.
	*/
    function Token(
        uint256 _supply,
        string _name,
        string _symbol,
        uint8 _decimals
    ) DetailedERC20(_name, _symbol, _decimals) public {
        require(_supply != 0);
        totalSupply_ = _supply;
        balances[msg.sender] = _supply;
        Transfer(address(0), msg.sender, _supply);  //event
    }
}
