pragma solidity ^0.4.17;
// We have to specify what version of compiler this code will compile with

contract Voting {
    mapping (bytes32 => uint8) public votesReceived;
    bytes32[] public candidateList; 

 
    function Voting(bytes32[] candidateNames) {
        candidateList = candidateNames;
    }

  // This function returns the total votes a candidate has received so far
    function totalVotesFor(bytes32 candidate) returns (uint8) {
        if (validCandidate(candidate) == false) throw;
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) {
        if (validCandidate(candidate) == false) throw;
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) returns (bool) {
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            } 
        }
        return false;
    }
}