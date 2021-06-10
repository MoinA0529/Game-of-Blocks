#Assignment 2

## Instructions to test the contract

* Open the [Remix IDE](https://remix.ethereum.org/) and create a new *.*sol* file.

* Copy and Paste the code present inside *assgn2.sol* in *auction.sol* and compile the code. 

* Download [Ganache GUI](https://www.trufflesuite.com/ganache) on your machine. Ganache helps you to test the smart contract on a private ethereum blockchain.

* Open Ganache and choose the option of **Quickstart**. You will be provided with 10 dummy accounts for making transactions and testing your smart contract. 

* On the left sidebar in Remix IDE, choose the option to Deploy the Smart Contract. 

* Change the Environment to *JavaScriptVM*.

* Choose the deploying account as first, this is the owner.

* Deploy the the contract and add principle, interest and time.

* Click getCompoundInterest to get the compound interest on the capital

###Requesting loan

* The owner can request from other users. P,R,T will be specified by the user.

* This will emit an event and add to the loans of owner

*