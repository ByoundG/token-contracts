pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
/**
 * @title Unlimited Mintable token
 * @dev Simple ERC20 Token example, with mintable token creation unlimited
 * Based on code by MintableToken: https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/token/ERC20/MintableToken.sol
 */
contract UnlimitedMintableToken is StandardToken {
    event Mint(address indexed to, uint256 amount);

    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount)  public returns (bool) {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(address(0), _to, _amount);
        return true;
    }
}