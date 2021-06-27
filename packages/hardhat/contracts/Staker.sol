// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "hardhat/console.sol";
import "./ExampleExternalContract.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Staker {
  mapping (address => uint ) public balances;
  uint public constant threshold = 1 ether;
  ExampleExternalContract public exampleExternalContract;
  event Stake(address, uint);


  constructor(address exampleExternalContractAddress) {
    exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
  }

  receive() external payable { stake(); }
  fallback() external payable { stake(); }
  
  function stake() public payable {
    balances[msg.sender] += msg.value;
    emit Stake(msg.sender, msg.value);
  }

  // After some `deadline` allow anyone to call an `execute()` function
  //  It should either call `exampleExternalContract.complete{value: address(this).balance}()` to send all the value



  // if the `threshold` was not met, allow everyone to call a `withdraw()` function



  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend


}
