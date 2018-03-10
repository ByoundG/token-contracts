# Token

### Token base contract - Defines the token supply

- Constructor: Token()
- **Constructor Parameters**
  * *address* `_supply`: the amount of tokens.


- This contract does **not** have a fallback function.

## Token Events

### Transfer(*address* indexed `owner`, *address* indexed `spender`, *uint256* `value`)

## Token Functions

### contribute(*uint256* `contributionLimit`, *uint8* `v`, *bytes32* `r`, *bytes32* `s`) public payable

Called by users to contribute to the sale if they have a valid whitelisting signature. Can only be called in the `SALE_IN_PROGRESS` stage.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *uint256* | `contributionLimit` | Contribution limit that the user was assigned |
| *uint8*   | `v`                 | `v` component of the ec signature |
| *bytes32* | `r`                 | `r` component of the ec signature |
| *bytes32* | `s`                 | `s` component of the ec signature |

### getDisbursements() internal pure

Returns the Disbursements (hardcoded token allocations made at the beginning of the sale). Should be overriden in child sale contracts (no disbursements by default).

#### Outputs

| type     | description                |
| -------- | -------------------------- |
| *Disbursement[]* | Disbursements to be made at the beginning of the sale |

### startConditions(*bytes32* `stageId`) internal constant

Determines if the given stage should start automatically. This function is overriden from the TimedStateMachine parent contract in order to add the automatic transition to the `SALE_ENDED` stage when the contribution cap is reached.

#### Inputs

| type      | name     | description      |
| --------- | -------- | ---------------- |
| *bytes32* | `stageId` | The id of the stage to query about |
|

#### Outputs

| type     | description                |
| -------- | -------------------------- |
| *bool* | Should the given stage start? |

### onSaleEnded() internal

Function that is called when entering the `SALE_ENDED` stage. It enables refunds in the Vault contract if the minimum threshold was not reached, and finalizes the token otherwise.

### finalizeToken() internal

Mints the remaining tokens (due to rounding errors) to the owner of the sale, finishes the minting of the token and transfers the ownership of the token to the owner of the sale.

## Sale Stages

`FREEZE`

This is just a freeze period that is active until the sale starts. No allowed functions in this stage (except for ownership related functions).

`SALE_IN_PROGRESS`

This stage has both a start timestamp and an end timestamp. In this stage, whitelisted users (check out the docs for the Whitelistable contract) can contribute Ether by calling the `contribute` function, providing a valid whitelist signature and their contribution amount.

The stage will transition to the next one if the end timestamp is reached or if the contribution cap is reached.

`SALE_ENDED`

If the sale fails (minThreshold amount is not reached), the saleFailed function is called in the vault contract to enable refunds.