// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract INEC {
    struct Candidate {
        string name;
        string politicalParty;
        string aka;
        uint noOfVote;
    }

    uint totalNumberOfCandidate;
    mapping(string => Candidate) public candidate;
    string[] Voters;

    mapping(string => bool) public voterHasVoted; // Track if a voter has voted

    function RegisterCandidate(
        string memory _name,
        string memory _Party,
        string memory _aka
    ) public {
        Candidate storage newCandidate = candidate[_aka];
        newCandidate.name = _name;
        newCandidate.politicalParty = _Party;
        newCandidate.aka = _aka;
        totalNumberOfCandidate += 1;
    }

    function VoteCandidate(string memory _aka, string memory _voter) public {
        require(!voterHasVoted[_voter], "Voter already voted"); // Check if voter has voted

        Candidate storage newCandidate = candidate[_aka];
        newCandidate.noOfVote += 1;
        voterHasVoted[_voter] = true; // Mark voter as voted
        Voters.push(_voter); // Add voter to list
    }

    function getTotalNumberOfVotes(
        string memory _aka
    ) public view returns (uint) {
        return candidate[_aka].noOfVote;
    }

    function getTotalNumberofCandidates() public view returns (uint) {
        return totalNumberOfCandidate;
    }
}
