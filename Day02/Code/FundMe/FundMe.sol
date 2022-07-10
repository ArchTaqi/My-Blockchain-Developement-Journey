//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import "./PriceConverter.sol";


// gas: 833,847
// after constant: 814287

error NotOwner();

contract FundMe {
    using PriceConverter for uint256; // what is this for?

    uint256 public constant MINIMUM_USD = 50 * 1e18; // constant keyword; variable that cant be changed

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    address public immutable i_owner; //immutable keyword

    constructor() { // Construction is the function that gets called immediately whenever you deploy a contract
        i_owner = msg.sender;
    }
    function fund() public payable{
       require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough!");  // 1e18 = 1 * 10 * 18 = 1000000000000000000
       // msg.value will have 18 decimals; since 1 ether = 1**18 Wei
       funders.push(msg.sender);
       addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        // make funded amount = 0
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset funders 
        funders = new address[](0);

        // withdraw amount 
        // three ways
        // transer / send / call

        // TRANSFER
        // msg.sender is of the type adderss
        // payable(msg.sender) is of the type payable

        // payable(msg.sender).transer(address(this).balance); 
        // payabvle is set at 2300 gas, if fails throws error
        
        // SEND
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");
        // send method is also capped at 2300 gas, if it fails returns boolean

        // CALL 
        (bool callSuccess, /*bytes memory dataReturned*/ ) = payable(msg.sender).call{value: address(this).balance}(""); // since we are not calling any function, no data will be returned, hence no need for bytes dataReturned
        require(callSuccess, "Call Failed!");
        // call method, forwards all gas or set gas, returns bool
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "Sender is not owner");
        if(msg.sender != i_owner) {revert NotOwner(); }
        _; // underscore represents doing the rest of the code

        // As of 0.8.4 of solidity, you can now use custom errors for reverts,
        // by using if instead of require, and saves a lot of gas
    }

    // What happens if someone sends ETH to this contract without calling the Fund function
    // Special Function: We can use recieve and fallback

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }


}
