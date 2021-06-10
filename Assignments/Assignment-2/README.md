## Assignment 2

* Open the [Remix IDE](https://remix.ethereum.org/) and create a new *.*sol* file.

* Copy and Paste the code present inside *assgn2.sol* in *loan.sol* and compile the code, we will refer this file as loan.sol.

* Download [Ganache GUI](https://www.trufflesuite.com/ganache) on your machine. Ganache helps you to test the smart contract on a private ethereum blockchain.

* Open Ganache and choose the option of **Quickstart**. You will be provided with 10 dummy accounts for making transactions and testing your smart contract. 

* On the left sidebar in Remix IDE, choose the option to Deploy the Smart Contract. 

* Change the Environment to *JavaScriptVM*.

* Choose the deploying account as first, this is the owner.

* Deploy the the contract and add principle, interest and time.

* Click getCompoundInterest to get the compound interest on the capital

**reqLoan** -  The owner can request from other users. P,R,T will be specified by the user.

**getOwnerBalance** - select an account for which you want to determine the balance, now click getOwnerBalance

**viewDues** - call to view the money owed by the user, call will get the amount of money the user owes the account

**settleDues** - only account1 can access, , transact will only work if there is enough balance in user's account


