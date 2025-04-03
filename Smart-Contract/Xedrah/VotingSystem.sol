// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/* A decentralized voting system that allows users to;

Create an election with multiple candidates.
Vote for a candidate in a specific election.
Track votes to ensure users can only vote once per election.
Retrieve election candidates and voters who participated.
The system must support multiple elections and store election details securely on the blockchain.

*/

contract VotingSystem {
    
    struct Election {
        string electionName;
        string[] candidateNames;
        mapping(address => bool) voters;
        uint256 _electionId;
        uint256 _candidateIndex;
        mapping(uint256 => mapping(address => bool)) voterAddress;
        
    }

function createElection(string memory electionName, string[] memory _candidateNames, uint256 _electionId) public {
        
}

function vote (uint256 _electionId, string memory _candidateName, address _address) public view returns (bool) {

}
function getCandidates(uint256 _electionId) public returns (string[] memory){

 }

 function getVoters(uint256 _electionId) public view returns (address[] memory) {
    
    return getVoters(_electionId);
 }
    function getElectionVotes(uint256 _index) external returns(address[] memory){
        
}



}
