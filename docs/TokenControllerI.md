# TokenControllerI

### TokenControllerI is an interface for token controllers. The controller specifies if a transfer can be done.

- This contract does **not** have a fallback function.

## TokenControllerI Function

### transferAllowed(*address* `_from`, *address* `_to`) external view returns (bool)

Specifies if a token transfer is allowed or not.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_from` | Address from where tokens are going to be withdrawn |
| *address*   | `_to`                 | Address to where tokens are going to be sent |

#### Output

| type     | description                |
| -------- | -------------------------- |
| *bool* | True if the transfer is allowed |

