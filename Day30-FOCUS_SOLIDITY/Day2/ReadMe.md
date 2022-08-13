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
### Local Variables
- Local variables are only used/declared inside a function.
- They exist only while the functon is executing.

- example #1
```solidity
contract StateVariables {
  uint public stateVariable = 123;
  
  function foo() {
    uint localVaraible = 777;
  }
}
```
- example #2
```solidity
contract LocalVariables {
  uint public i;
  bool public b;
  address public addr;
  
  function foo() external {
    uint a = 777;
    bool f = false;
    // code
    x += 334;
    f = true;
    
    i = 21000000;
    b = true;
    addr = address(1);
  }
}
```

Once the contract is deployed you can only find the State Variables ```i``` and ```b``` and the data stored still remains in the blockchain and persists even after the function is done executing, However the Local Variables no longer exists.
