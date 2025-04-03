//SPDX-License-Identifier: Mit

pragma solidity ^0.8.20;

contract VotingSystem{
    struct Candidate {
        string name;
        string description;
        uint256 voteCount;

    }
    uint256 public totalVoteCount;
    mapping (string => Candidate) public candidates;

    function addCandidate(string memory _name, string memory _description) external {
        Candidate storage newCandidate = candidates[_name];
        newCandidate.name = _name;
        newCandidate.description =_description;

    }
    function vote(string memory _candidateName) external {
        candidates[_candidateName].voteCount +=1;
        totalVoteCount +=1;
    }
    function candidateVoteCount(string memory _candidateName) external view returns (uint256){
        return candidates[_candidateName].voteCount;
    }
    function totalVotes() external view returns (uint256) {
        return totalVoteCount;
    }
}