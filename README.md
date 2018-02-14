# sale-contracts

Code for the new token foundry token and sale base contracts.

## Contracts

- [Sale.sol](/contracts/Sale.sol): Abstract base contract from which all sales inherit. It implements a basic sale structure and common functions.
- [DisbursementHandler.sol](/contracts/DisbursementHandler.sol): Contract that is used by the sale in order to lock tokens until a timestamp.

## Instructions

In order to build and test the contracts found in this repo, [Truffle](truffleframework.com) version > 4 is needed.

### Building

Once the repo is cloned, run `npm install` to install all the dependencies.

Running `truffle compile` will compile the contract code and place the output in the `build/contracts` directory.

### Testing

`truffle test` to run all the tests.

`npm run coverage` to run tests and get code coverage.

## License

MIT
