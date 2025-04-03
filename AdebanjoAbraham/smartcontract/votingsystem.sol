// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;
/*A decentralized Voting System allows users to:**

**Create an election with multiple candidates.
Vote for a candidate in a specific election.
Track votes to ensure users can only vote once per election.
Retrieve election candidates and voters who participated.
The system must support multiple elections and store election details securely on the blockchain.*/

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

 function vote(string memory _electionName, string memory _candidatename) public{
    string memory newvote = voters[_electionName].candidatesname[_candidatename];
 } 

 function  getCandidates(uint _electionId) → Candidate[] public view returns (Candidate[] memory) {
    return elections[_electionId].candidates;
}

function getVoters(uint _electionId) → address[] public view returns (address[] memory) {
    return elections[_electionName].voters;
}
}