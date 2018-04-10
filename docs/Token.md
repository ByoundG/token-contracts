# Token

### Token base contract - Defines the basic structure for a token

- **Constructor Parameters**
  * *uint256* `_supply`: the total supply of this instantiation of tokens.
  * *string* `_name`:  is the long name by which the token contract should be known
  * *string* `_symbol`: The set of capital letters used to represent the token e.g. DTH.
  * *uint8* `_decimals`: The number of decimal places the tokens can be split up into. This should be between 0 and 18.

- `_name`, `_symbol` and `_decimals` are parameters used in the DetailedERC20 constructor. DetailedERC20 is an OpenZeppelin contract. 
- This contract does **not** have a fallback function.


## Token Events

### Transfer(*address* indexed `from`, *address* indexed `to`, *uint256* `value`)
  - logs the transferral of tokens between addresses
  - inherited from ERC20Basic contract (an OpenZeppelin contract)

## Token inheritance diagram
![Token inheritance diagram](/diagrams/token.png)
