# Token

### Token base contract - Defines basic structure for a token

- Constructor: Token()
- **Constructor Parameters**
  * *address* `_supply`: the initial amount of tokens.

- This contract does **not** have a fallback function.

## Token Events

### Transfer(*address* indexed `owner`, *address* indexed `spender`, *uint256* `value`)
  - inherited from ERC20Basic contract

## Token inheritance diagram
![Token inheritance diagram](/diagrams/token.png)