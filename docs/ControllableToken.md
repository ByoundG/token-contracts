# ControllableToken

### ControllableToken contract - It queries a token controller contract to check if a transfer is allowed 

- This contract does **not** have a fallback function.

## ControllableToken Functions

### setController(*TokenControllerI* `_controller`) onlyOwner public

Set the `controller` contract. `controller` must have implemented `transferAllowed` function. This function would have a client specific business rules of token transfer. 

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *TokenControllerI* | `_controller` | Controller contract with an implemented `transferAllowed` function |


### transfer(*address* `_to`, *uint256* `_value`) isAllowed(`msg.sender`, `_to`) public returns (bool)

Calls *BasicToken* `transfer` function to transfer token for a specified address. `_value` must be less or equal of `msg.sender` token balance. `isAllowed` modifier executes *controler* `transferAllowed` function to check if `msg.sender` can transfer token to `_to`. Returns success.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_to` | Address to where tokens are sent |
| *uint256* | `_value` | Number of tokens to transfer |

### transferFrom(*address* `_from`, *address* `_to`, *uint256* `_value`) isAllowed(`_from`, `_to`) public returns (bool)

Calls *StandardToken* `transferFrom` function to transfer token from one address to another. `_value` must be less or equal of `from` balance of tokens and less or equal of the amount that was previously allowed to `msg.sender` transfer between `_from` and `_to`. And `isAllowed` modifier executes *controler* `transferAllowed` function to check if `_from` can transfer token to `_to`. Returns success.Returns success.
