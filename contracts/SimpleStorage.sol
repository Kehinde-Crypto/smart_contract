// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage{

    address  public owner;
enum Transaction{
    Accept,
    Decline,
    Prostpone
}
 Transaction public transaction;
constructor() {
    owner = msg.sender;
} 
    modifier onlyOwner {
        require(owner == msg.sender, "owner is the main contract owner");
        _;
    }
     function sendEth(uint256 _amount) public payable  onlyOwner returns (bool) {
        
          if(uint8(transaction) != uint8(Transaction.Accept)){
    revert("Transaction will not accept");
   }
   payable(owner).transfer(_amount);
    return true;
     }
}
    
