# Day 1

## License Identifier

You have to start with a SPDX License Identifier at the top of your solidity file.

`// SPDX-License-Identifier: MIT`

We use [MIT](https://spdx.org/licenses/MIT) in the license name because it is granted free-of-charge and without restrictions.

## Pragma 
We use pragma to define the solidity verison

```solidity 
pragma solidity ^0.8.0;
// Anything above 0.8.0

pragma solidity >=0.8.0 <0.9.0;
// Anything between 0.8.0 to 0.9.0 where 0.9.0 is not included.

pragma solidity 0.8.8;
// Only Version 0.8.8
```
