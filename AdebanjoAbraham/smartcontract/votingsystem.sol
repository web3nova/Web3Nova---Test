// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;


contract votingsystem {

struct voter {
    string electionname;
    string [] candidatesname;

    
}
mapping (string => voter) public voters;

function createElection(string memory _electionName, string[] memory _candidateNames) public{
voters[_electionName] = voter({
    electionname: _electionName,
    candidatesname: _candidateNames
});
}

 function vote(string memory _electionName, uint _candidateIndex) public{
    string memory newvote = voters[_electionName].candidatesname[_candidateIndex];
    

 }  
}