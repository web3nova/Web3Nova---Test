// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Scenario Description
// **A decentralized Voting System allows users to:**

// **Create an election with multiple candidates.
// Vote for a candidate in a specific election.
// Track votes to ensure users can only vote once per election.
// Retrieve election candidates and voters who participated.
// The system must support multiple elections and store election details securely on the blockchain.**

// 📌 Contract Features & Functions
// 1️⃣ createElection(string _electionName, string[] _candidateNames)

// ✅ Creates a new election.
// ✅ Accepts an election name and a list of candidate names.
// ✅ Stores the election with multiple candidates in an array inside a struct.
// ✅ Expected behavior:

// A new election is added with the given name.
// Each candidate starts with zero votes.
// 2️⃣ vote(uint _electionId, uint _candidateIndex)

// ✅ Allows a user to vote for a candidate in an election.
// ✅ Uses nested mapping to track whether a voter has voted in an election.
// ✅ Updates the vote count of the chosen candidate.
// ✅ Expected behavior:

// The user can vote only once per election.
// The candidate's vote count increases.
// The voter's address is stored in a nested array per election.
// 3️⃣ getCandidates(uint _electionId) → Candidate[]

// ✅ Retrieves all candidates for a given election.
// ✅ Returns an array of candidate names and their vote counts.
// ✅ Expected behavior:

// The function returns a list of all candidates in an election.
// The candidate structure includes their name and vote count.
// 4️⃣ getVoters(uint _electionId) → address[]

// ✅ Returns a list of all voters for a specific election.
// ✅ Uses nested arrays to track voters per election.
// ✅ Expected behavior:

// The function returns all addresses that have voted in a given election.


contract electoralSystem {
    struct Candidate {
        string name;
        uint voteCount;
    }
    function createElection(string memory _electionName, string[] memory _candidateNames) public {
        Election storage newElection = elections;
    }
}