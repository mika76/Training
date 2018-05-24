pragma solidity ^0.4.18;

contract SuggestionBox {
  
  mapping (bytes32 => uint8) public votesReceived;
    
  bytes32[] public suggestionList;

  function SuggestionBox(bytes32[] suggestions) public {
    suggestionList = suggestions;
  }

  
  function totalVotesFor(bytes32 suggestion) view public returns (uint8) {
    require(validSuggestion(suggestion));
    return votesReceived[suggestion];
  }

  function voteForSuggestion(bytes32 suggestion) public {
    require(validSuggestion(suggestion));
    votesReceived[suggestion] += 1;
  }

  function validSuggestion(bytes32 suggestion) view public returns (bool) {
    for(uint i = 0; i < suggestionList.length; i++) {
      if (suggestionList[i] == suggestion) {
        return true;
      }
    }
    return false;
  }
}