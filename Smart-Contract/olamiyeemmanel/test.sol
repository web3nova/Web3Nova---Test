//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Votes {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    struct electionDetails {
        uint256 id;
        string electionName;
        string[] candidateNames; 
        uint count;
    }

    error NotAuthorized(address);

    address[] public voters;
    mapping(address => bool) public voterState;

    mapping(uint256 => electionDetails) public Elections;  

    function createElection(uint256 idx, string calldata _electionName, string[] calldata _candidateNames) public{
       electionDetails storage electiondetail = Elections[idx];
       
       string memory electionName = _electionName;
       string[] memory candidateName;

        uint index = 0;
       for(uint i = 0; i < _candidateNames.length; i++) {
            candidateName[index] = _candidateNames[i];
            index++;
        }

        electiondetail.electionName = electionName;
        electiondetail.candidateNames = candidateName;
    }

    function vote(uint _electionId) public{
        for(uint i = 0; i < voters.length; i++) {
            if(voterState[msg.sender] == true) {
                revert NotAuthorized(msg.sender);
            } else {
                voterState[msg.sender] = true;
            }
        }

        electionDetails storage electiondetail = Elections[_electionId];
        electiondetail.count += 1;
        voters.push(msg.sender);
    }

    function getCandidate(uint _electionId) public view returns(string[] memory candidate){
        electionDetails storage electiondetail = Elections[_electionId];

        string[] memory candidateName = electiondetail.candidateNames;
        return candidateName;   
    }

    function getVoters() external view returns(address[] memory addresses){
        address[] memory allVoters = voters;
        
        for(uint i = 0; i <= 100; i++) {
            allVoters[i] = voters[i];
        }

        return allVoters;
    }
}