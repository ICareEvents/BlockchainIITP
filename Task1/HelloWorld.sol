//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;ww
contract Task1 
{
    string public message;
    constructor() 
       {
           message="Hello World";
       }
    function update(string memory newMessage) public 
    {
        message=newMessage;
    }
}
