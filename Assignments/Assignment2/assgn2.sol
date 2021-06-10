// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.7.0;

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract MetaCoin {
	mapping (address => uint256) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() public {
		balances[tx.origin] = 100000;
	}

	function sendCoin(address receiver, uint256 amount, address sender) public returns(bool sufficient) {
		if (balances[sender] < amount) return false;
		balances[sender] -= amount;
		balances[receiver] += amount;
		emit Transfer(sender, receiver, amount);
		return true;
	}


	function getBalance(address addr) public view returns(uint256) {
		return balances[addr];
	}
}

// Try not to edit the contract definition above

contract Loan is MetaCoin {
// You can edit this contract as much as you want. A template is provided here and you can change the function names and implement anything else you want, but the basic tasks mentioned here should be accomplished.
    mapping (address => uint256) private loans;
     
    event Request(address indexed _from, uint256 P, uint R, uint T, uint256 amt);
    
    address private Owner;

    
    modifier isOwner() {
        // Implement a modifier to allow only the owner of the contract to use specific functions
        require(msg.sender == Owner, "Invalid user");
        _;
    }
    
    constructor() public {
        Owner = msg.sender;
        emit OwnerSet(address(0), Owner);
    }    
    function getCompoundInterest(uint256 principle, uint rate, uint time) public pure returns(uint256) {
        uint256 tmp = principle;
        for(int i=0;i<time;i++) {
            tmp = tmp + SafeMath.div(SafeMath.mul(tmp,rate),uint256(100)); // use divide and multiply from safe math
        }
        return principle-tmp;
    }

    function reqLoan(uint256 principle, uint rate, uint time) public returns(bool correct) {
        uint256 toPay = principle + getCompoundInterest(principle, rate, time);
        loans[msg.sender] = toPay;
        emit Request(msg.sender, principle, rate, time, toPay);
        return true;
    }

    function getOwnerBalance() public view returns(uint256) {
		return super.getBalance(owner);
    }

    function viewDues(address user) public view isOwner return(uint256) {
        return loans[user];
    }

    function settleDues(address user) public isOwner returns (bool correct) {
        bool flg = super.sendCoin(user, loans[user], Owner); // using built in sendCoin function 
        if(flg == true) {
            loans[user] = 0;
        }
        return flg;
    }
}
