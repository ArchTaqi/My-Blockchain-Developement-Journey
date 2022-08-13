# Day :two: 

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
