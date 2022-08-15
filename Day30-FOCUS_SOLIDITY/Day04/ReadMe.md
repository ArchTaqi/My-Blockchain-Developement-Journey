# Day :four:

## Error 
There are three ways to throw an error in solidity:
- require
- revert
- assert 

In occurence of error the gas gets refunded and any state variables that were updated will be reverted.

Starting with solidity 0.8 we can use ```custom errors``` to throw error to save gas.


### Require
Require is mostly used to validate inputs, and for access control, which means controlling who gets to call the function.

```solidity

contract Error {
  function testRequire(uint _i) public pure {
    require( _i <= 10, "i > 10");
    // code 
  }
}

```
- require(```condition```, ```"error message"```). If the condition is not meet it throws an error message. If it [asses it goes to more code.

### Revert
Revert is a better option if the conditions are nested and there are a lot of if statements.

```solidity

contract Error {
  function testRevert(uint _i) public pure {
    if( _i > 1) {
      // code 
      if( _i > 2){
        // more code 
        if(_i > 10){
          revert("i > 10");
        }
      }
    }
  }
}

```

### Assert 
Assert is used to check the condition that will always be true. If the condition evalutes to false then it means there might be a bug in the smart contract.

```solidity

contract Error {
  uint public num = 123;
  function testAssert() public view {
    assert(num === 123);
  }
  
  function foo(uint _i) public {
  num += 1;
  require( _i < 10)
  }
  
}

```

- When an error is thrown there will be a gas refund. If you sent 1000 gas and the function used 100 gas, upon failure 900 gas would be refunded.
- In the function ```foo()```, if we pass i = 13, it will update the state variable, and checks the condition, when check fails, it reverts the value of the state varaiable to it's initial value.


### Custom Errors
Custom errors are used to save gas. The longer the error message the more gas it will use. Errors can only be used with revert.

```solidity

contract Error {

  error MyError(address cal);
  
  function testCustomError(uint _i) public pure {
    if(_i > 10) {
      revert MyError();
    }
  }
  
}

```






