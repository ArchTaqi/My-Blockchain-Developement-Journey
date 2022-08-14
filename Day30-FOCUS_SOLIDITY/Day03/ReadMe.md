# Day :three:

## Default Values
If we do not assign a value to a variable, then that variable will have a default value.

```solidity

contract DefaultValues { // creating state variables
  bool public b; // false
  uint public u; // 0
  int public i; // 0
  address public a; // 0x0000000000000000000000000000000000000000 (a sequence of 40 zeroes)
  bytes32 public b32; // 0x0000000000000000000000000000000000000000000000000000000000000000 32byte hexadecimal representation of zero
  // a sequence of 64 zeroes
}

```
The default values of ```mapping```, ```structs```, ```enums``` and ```fixed sized arrays``` will be discussed in later sections.

## Constants 
A state variable that never changes must be declared as constants. By doing so we will be able to save gas, when a function is called that uses that state variable.

```solidity

contract Constatns {
  address public constant MY_ADDRESS = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
  uint public constant MY_UINT = 123;
}

contract Var {
  address public MY_ADDRESS = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045; // not constant
}

```
- ```constant``` keyword is used to declare a constant.
- It is best-practice to CAPITALIZE the name of the constant.
- The gas execution cost for calling ```MY_ADDRESS``` in the contract ```Constants``` will be cheaper than ```Var```.
