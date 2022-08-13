# Day 2

## First Smart Contract

```solidity 

// SPDX-License-Identifier: MIT

pragma solidity 0.8.7; // compiler version

contract HelloWorld {
  string public greeting = "Hello World!";
}

```

- ```string``` is the data-type.
- ```public``` tells we have read-access to this variable after we deploy the smart contract.
- ```greeting``` is the name of the variable.

Once the contract is deployed, the variable ```greeting``` will be stored on the blockchain.
We can call ```greeting``` from the contract ```HelloWorld``` and the value "Hello World!" is returned.

Congratulations, you have written your first Smart Contract!
