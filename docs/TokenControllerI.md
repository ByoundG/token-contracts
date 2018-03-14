# TokenControllerI

### TokenControllerI is an interface for token controllers. The controller specifies whether a transfer can be done.

- This contract does **not** have a fallback function.
- This contract does **not** have a constructor.

## TokenControllerI Function

### transferAllowed(*address* `_from`, *address* `_to`) external view returns (bool)
Specifies if a token transfer is allowed or not.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_from`  | Inquiring whether this address is allowed to send tokens to `to` |
| *address* | `_to`    | Inquiring whether this address is allowed to receive tokens from `from` |

#### Output

| type     | description                |
| -------- | -------------------------- |
| *bool* | True if the transfer is allowed |
