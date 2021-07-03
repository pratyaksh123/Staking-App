// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "hardhat/console.sol";
import "./ExampleExternalContract.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Staker {
  mapping (address => uint ) public balances;
  uint256 public constant threshold = 1 ether;
  uint256 public deadline = block.timestamp + 60;
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
  function execute() public payable {
    require(block.timestamp > deadline && address(this).balance >= threshold,"Execution not allowed!");
    exampleExternalContract.complete{value: address(this).balance}();
  }

  // if the `threshold` was not met, allow everyone to call a `withdraw()` function
  function withdraw(address payable _to) public payable{
    require(block.timestamp > deadline && address(this).balance < threshold && balances[_to] > 0,"Withdraw not allowed!");
    _to.transfer(balances[_to]);
    balances[_to] = 0;
  }


  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend
  function timeLeft() public view returns(uint){
    uint temp = deadline - block.timestamp;
    if (temp <= 0){
      temp = 0;
    }
    return temp;
  }

}
