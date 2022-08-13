# Day 2 
[Source](https://www.youtube.com/channel/UCJWh7F3AFyQ_x01VKzr9eyA)


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

## Data Types 

The data types in solidity are of two types 
- Values: It means the data stores a value. ex: int, string, bool etc.
- references: stores a reference to where the actual data is stored. ex: array, object, etc.

### Common Value types

```solidity

contract ValueTypes {
  bool public b = true;
  uint public u = 123; // uint = uint256 0 to 2**256 - 1
                       //        uint8   0 to 2**8 - 1
                       //        uint16  0 to 2**16 - 1
  int public i = -123; //  int = int256 -2** 255 to 2**255 -1
                       //        int128 -2**127 to 2**127 -1
  int public minInt = type(int).min // minimum integer
  int public maxInt = type(int).max // maximum integer
  
  address public addr = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
  bytes32 public b32 = 0x000000000000000000000000697cb3a91d22f4cb39aeea7eb4a410fedd0bbe06
}
```
- ```bool``` boolean, stores either true(1) or false(1).
- ```uint``` usigned integer stores zero or positive numbers.
- ```int``` integers stored negative, zero and positive numbers.
- ```min/max value``` finds what the minimum or maximum value of a datatype is.
- ```address``` is used to store the value of any address.
- ```bytes32``` this data type is used when working with the hash function ```keccak256```


```for future reference``` converting bytes32 address to address
```solidity
contract Conversion {
    function test(bytes32 _input) external pure returns (address) {
        return address(uint160(uint256(_input)));
    }
}
```

## Functions

Basic syntax
```solidity
contract FunctionIntro {
  function add(uint a, uint b) external pure returns(uint){
    retunrn a + b;
  }
  
  function sub(uint a, uint b) external pure returns(uint){
    return a - b;
  }
```

- ```(input_datatype input_name, input_datatype input_name, ...)``` The function contains the input datatype and the name of the input inside the paranthesis.
- ```external``` when we deploy the contract we will be able to call this function.
- ```pure``` means this function is read only, it does not write anything to the blockchain.
- ```returns()``` declares the type of output returned.


## Variables 

There are three types of variables in solidity
1. Local Variables
2. State Variables
3. Global Variables

### State Variables
- State variables are the variables which store data on the blockchain.
- State variables are declared inside of a contract but outside of a function.

```solidity
contract StateVariables {
  uint public stateVariable = 123;
  
  function() {
  
  }
}
```
- Local Variables are declared inside the function, and they exist only while the functon is executing.

```solidity
contract StateVariables {
  uint public stateVariable = 123;
  
  function foo() {
    uint localVaraible = 777;
  }
}
```
