
##Assignment 2

* Open the [Remix IDE](https://remix.ethereum.org/) and create a new *.*sol* file.

* Copy and Paste the code present inside *assgn2.sol* in *auction.sol* and compile the code. 

* Download [Ganache GUI](https://www.trufflesuite.com/ganache) on your machine. Ganache helps you to test the smart contract on a private ethereum blockchain.

* Open Ganache and choose the option of **Quickstart**. You will be provided with 10 dummy accounts for making transactions and testing your smart contract. 

* On the left sidebar in Remix IDE, choose the option to Deploy the Smart Contract. 

* Change the Environment to *JavaScriptVM*.

* Choose the deploying account as first, this is the owner.

* Deploy the the contract and add principle, interest and time.

* Click getCompoundInterest to get the compound interest on the capital

___

### TASK

* Initialise an account(account 1) as owner who deploys the contract
* initial 100k credits are loaned to owner through various accounts

___

### Functions

**reqLoan** -  The owner can request from other users. P,R,T will be specified by the user.

**getOwnerBalance** - select an account for which you want to determine the balance
	
* returns value of compound interest to be applied on the particular account

**viewDues** - call to **view** the money owed by the user


**settleDues** - only account1 can access

___

### Precautions for floating point approximations

* SafeMath general arithmatic
* Iterative computation of compound interest
