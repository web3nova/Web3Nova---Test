// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Voting {
    struct Election {
        string electionName;
        string[] candidatesName;
        mapping(string => uint) votes; 
    }

    struct Voter {
        bool hasVoted;
        string votedFor;  
    }

    address public owner;

    mapping(uint => Election) public elections;
    mapping(address => mapping(uint => Voter)) public voters;  

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action.");  
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function createElection(uint _electionId, string memory _electionName, string[] memory _candidateNames) public onlyOwner {
        Election storage election = elections[_electionId];
        election.electionName = _electionName;
        for (uint i = 0; i < _candidateNames.length; i++) {
            election.candidatesName.push(_candidateNames[i]);
        }
    }

    function vote(uint _electionId, string memory _candidateName) public {
        Election storage election = elections[_electionId];
        Voter storage voter = voters[msg.sender][_electionId];

        require(!voter.hasVoted, "You have already voted.");
        bool validCandidate = false;

        for (uint i = 0; i < election.candidatesName.length; i++) {
            if (keccak256(abi.encodePacked(election.candidatesName[i])) == keccak256(abi.encodePacked(_candidateName))) {
                validCandidate = true;
                break;
            }
        }
        require(validCandidate, "Invalid candidate.");
        
        election.votes[_candidateName]++;
        voter.hasVoted = true;
        voter.votedFor = _candidateName;
    }

    function getCandidates(uint _electionId) public view returns (string[] memory) {
        return elections[_electionId].candidatesName;
    }

    function getVotes(uint _electionId, string memory _candidateName) public view returns (uint) {
        return elections[_electionId].votes[_candidateName];
    }
}
