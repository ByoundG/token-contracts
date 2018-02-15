# token-contracts

Code for the new token foundry implementation using open zepppeling ERC20 implementation.

## Contracts

- [ERC223BasicToken.sol](/contracts/token/ERC223BasicToken.sol): Implementation of ERC223 draft standard, ERC20 compliant.
- [HumanStandardToken.sol](/contracts/token/HumanStandardToken.sol): Implementation of HumanStandardToken draft standard, ERC20 compliant.
- [ExampleToken.sol](/contracts/ExampleToken.sol): Example of Token Contract, ERC20, ERC223, HumanStandardToken compliant.

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
