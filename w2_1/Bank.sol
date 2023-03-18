// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Bank{


    address payable public owner;
    mapping(address => uint) public transferUser;
  
    constructor() payable {
        owner = payable(msg.sender);
    }


    receive() external payable {
      transferUser[msg.sender] += msg.value;
    }

    fallback() external payable {
    }
   

    function withdrawAll() public {
        uint amount = address(this).balance;

        (bool success,) = owner.call{value: amount}("");
        require(success, "fail withdraw");
    }


}