// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract votingSystem{
    struct Candidate{
        string Candidatename;
        uint256 voteCount; 
    }
    
    struct Election {
        string name;
        Candidate[] candidates;
        address[] voters;
        uint256 totalVotes;
    }
    mapping (string =>Election) public elecetionList;
    

 function createElection(string memory _electionName, string[] memory _candidateNames) public returns (uint256) {
           Candidate[_name]
 }
}