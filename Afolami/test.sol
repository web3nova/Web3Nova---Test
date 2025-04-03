pragma solidity 0.8.26;

contract ElectionSystem{

 struct ElectionDetails{
    string name;
    uint256 candiddates;
    uint electionid;
Candidates[] candidate;
}

    struct Candidates{
    string candidatename;
    uint  id;
    address walletAddress;}
  uint256 public TotalnumberOfCandidates;

 Candidates[] public candidate;

 mapping (string=>ElectionDetails) election_systems;

 function addElection( string memory _name, uint _electionid, Candidates[] memory) external {
    ElectionDetails storage election= election_systems[_name];
        election.candiddates = 0;
        election.electionid = _electionid;
        election.name = _name;
        }

function addCandidate ( string memory _candidatename, string memory _name,  uint _id, address _walletAddress) external {
 Candidates memory newCandidate=  Candidates(  _candidatename ,_id, _walletAddress);
   ElectionDetails storage election= election_systems[_name];
       election.candidate.push(newCandidate);        
        require( keccak256(bytes(_name)) == keccak256(bytes(election.name)), "Election not registered" );
        TotalnumberOfCandidates +=1;
        }


}



 
