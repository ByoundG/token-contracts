# Token

### Token base contract - Defines the basic structure for a token

- **Constructor Parameters**
  * *uint256* `_supply`: the total supply of this instantiation of tokens.

- This contract does **not** have a fallback function.

## Token Events

### Transfer(*address* indexed `from`, *address* indexed `to`, *uint256* `value`)
  - logs the transferral of tokens between addresses
  - inherited from ERC20Basic contract

## Token inheritance diagram
![Token inheritance diagram](/diagrams/token.png)
