// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;


contract votingsystem {

struct voter {
    uint voterid;
    string name;
    bool hasVoted;
    
}
mapping (uint => voter) voters;

function registervoter(uint256 _voterid, string memory _name)public {
voters[_voterid] = voter(_voterid, _name, false);  
}
   
}