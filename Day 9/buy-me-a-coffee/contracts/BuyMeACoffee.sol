//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

// Deployed at 0x5FbDB2315678afecb367f032d93F642f64180aa3 (Hardhat)
// Deployed at 0xb5530e07FcEea339E915edd087a981F3774a1E1B (Goerli)
contract BuyMeACoffee {
    // Event to emit when a Memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // Memo struct
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // List of all memos received from friends
    Memo[] memos;

    // Address of contract deployer
    address payable owner;

    // Runs once during deployment
    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev buy a coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message from the coffee buyer
     */
    function buyCoffee(string memory _name, string memory _message)
        public
        payable
    {
        require(msg.value > 0, "You can't buy coffee with 0 ETH");

        // Add the memo to storage
        memos.push(Memo(msg.sender, block.timestamp, _name, _message));

        // Emit a log event when a new memo is created
        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    /**
     * @dev send the entire balance stored in this contract to the owner
     */
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    /**
     * @dev retrieve all the memos received and stored on the blockchain
     */
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }

    // /**
    //  * @dev update the withdraw to address
    //  */
    // function updateWithdrawAddress(address _address) public onlyOwner {
    //     withdrawToAddress = payable(_address);
    // }

    // /**
    //  * @dev get withdraw to address
    //  */
    // function getWithdrawAddress() public view onlyOwner returns (address) {
    //     return withdrawToAddress;
    // }
}
