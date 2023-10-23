// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract swimmingRefferal{
    address[] public members;
    mapping(address => bool) public addressmaps;
    
    function join() public payable {
        require(msg.value == 1 ether);
        members.push(msg.sender);
        addressmaps[msg.sender] = true;

    }
    function join_referrer(address referrer) public payable{
        require(addressmaps[referrer] == true);
        join();
        (bool success,) = referrer.call{value:msg.value/10}("");
        
    }

    function get_members()public view returns(address[] memory){
        return members;
    }

   }