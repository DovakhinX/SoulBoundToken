// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.4;

import "./ERC4973.sol";

 contract SBT is ERC4973{

address public owner;
uint public tokenId=0;

modifier onlyOwner(){
    require(msg.sender==owner,"Not Authorised");
    _;
}

constructor () ERC4973("SoulToken","STK"){
    owner=msg.sender;
}

 function burn(uint256 _tokenId) public override  {
    require(ownerOf(_tokenId)==msg.sender||msg.sender==owner,"Not Authorised");
    _burn(_tokenId);
  }

function mint(address to,string calldata _uri)external onlyOwner{
 _mint(to,tokenId,_uri);
 tokenId += 1;
}
}
