# SaleTokenController

### SaleTokenController is an abstract smart contract. The controller implements the logic to calculate whether or not a transfer is permitted.

- **Constructor Parameters**
  * *Sale* `_sale`: the sale that was for the token that this controller is to control.

- This contract does **not** have a fallback function.

## SaleTokenController Function

### transferAllowed(*address* `_from`, *address* `_to`) external view returns (bool)
Specifies if a token transfer is allowed or not. This implementation allows a transfer if any of the following is true:
- The token sender did not contribute to the sale (and therefore has received it in a previous transfer)
- The recipient is allowed to receive a token (for example the recipient is the team's protocol)
- The sender has used some of their other tokens to contribute to the team's protocol.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_from`  | Inquiring whether this address is allowed to send tokens to `to` |
| *address* | `_to`    | Inquiring whether this address is allowed to receive tokens from `from` |

#### Output

| type     | description                |
| -------- | -------------------------- |
| *bool* | True if the transfer is allowed |


### hasUsedProtocol(*address* `_contributor`) internal view returns (bool)
Checks whether the named contributor has used the team's protocol

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_contributor`  | The address that the inquiry is with regards to |

#### Output

| type     | description                |
| -------- | -------------------------- |
| *bool* | True if the address has used the protocol |


### recipientAllowed(*address* `_recipient`) internal view returns (bool)
Checks whether the named recipient should be allowed to receive a token at the current moment in time. (For example if the recipient is the team's protocol).

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *address* | `_recipient`  | The address that the inquiry is with regards to |

#### Output

| type     | description                |
| -------- | -------------------------- |
| *bool* | True if the address has used the protocol |
