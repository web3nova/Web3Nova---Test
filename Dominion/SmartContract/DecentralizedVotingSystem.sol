// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract DecentralizedVotingSystem {
    struct Election {
        string electionName;
        string candidateName;
        string electionId;
        uint voteCount;
    }
    mapping (string => Election) public election;
    mapping (string => mapping (address => bool)) public hasVoted;
    string[] public electionList;
    address[] public votersList;
    string[] public candidateList;

    function createElection(string memory _electionName, string memory _electionId, string memory _candidateName) external {
        Election memory newElection = election[_electionName];
        newElection.electionName = _electionName;
        newElection.candidateName = _candidateName;
        newElection.electionId = _electionId;

        candidateList.push(_candidateName);
        electionList.push(_electionName);
    }

    function voteForCandidate (string memory candidateName, string memory _electionName) external {
        election[candidateName].voteCount += 1;
        votersList.push(msg.sender);
        hasVoted [_electionName][msg.sender] = true;
    }

    function getCandidates() external view returns(string[] memory) {
        return candidateList;
    }

    function getVoters () external view returns (address[] memory) {
        return votersList;
    }

}    