pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";


contract TestnetToken is StandardToken {
    uint256 public amountToGenerate;

    mapping(address => bool) public hasGeneratedTokens;

    function TestnetToken(uint256 _amountToGenerate) public {
        require(_amountToGenerate != 0);
        amountToGenerate = _amountToGenerate;
    }
    
    /// @dev Called by anyone to get `amountToGenerate` tokens. It can only be called once by each address.
    function generateTokens() external {
        require(!hasGeneratedTokens[msg.sender]);

        hasGeneratedTokens[msg.sender] = true;

        balances[msg.sender] = balances[msg.sender].add(amountToGenerate);
    }

}
