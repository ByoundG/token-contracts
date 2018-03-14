# ControllableToken

### ControllableToken contract - an ownable, standard token, that queries a token controller to check whether a transfer is allowed 

- This contract does **not** have a fallback function.
- This contract does **not** have a constructor.


## ControllableToken Functions

### setController(*TokenControllerI* `_controller`) onlyOwner public
Set the `controller` that is to be used to control transfers of this token. The `controller` must have implemented the `transferAllowed` function which defines client specific business rules of token transfer. 

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *TokenControllerI* | `_controller` | Controller contract with an implemented `transferAllowed` function |


### transfer(*address* `_to`, *uint256* `_value`) isAllowed(`msg.sender`, `_to`) public returns (bool)
Calls *BasicToken*'s `transfer` function to transfer token for a specified address. The `isAllowed` modifier executes the *controller* `transferAllowed` function to check whether `msg.sender` is permitted to transfer tokens to `_to`. Further, `_value` must be less than or equal to `msg.sender`'s token balance.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_to` | Address where tokens are requested to be sent |
| *uint256* | `_value` | Number of tokens to transfer |


### transferFrom(*address* `_from`, *address* `_to`, *uint256* `_value`) isAllowed(`_from`, `_to`) public returns (bool)
Calls *StandardToken*'s `transferFrom` function to transfer tokens from one address to another. `_value` must be less than or equal to `from`'s balance of tokens. The `isAllowed` modifier again executes *controller*'s `transferAllowed` function to check if `_from` can transfer tokens to `_to`.
