### Simple Staking App
![image](https://user-images.githubusercontent.com/55044774/124361836-dab84000-dc4e-11eb-955d-bf759d6e8977.png)

- Allows people to stake some ETH in a smart contract.
- If the Deadline is reached before the threshold is reached, allows anyone to call withdraw() method to withdraw thier funds.
- If the collected ETH reaches >= threshold, the complete() method of `ExampleExternalContract` is triggered sending the full amount to that contract.

#### Future Development
- Make a crowd funding platform based on this dApp.
- Make the contract more customizable and allow people to create pools.

##### Build on Scaffold-eth
https://github.com/austintgriffith/scaffold-eth/tree/challenge-1-decentralized-staking

###### Deployed at https://incompetent-tendency.surge.sh/
