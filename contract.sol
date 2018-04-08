pragma solidity ^0.4.0;
contract Will {

    address mark;
    uint deadline;
    private uint passwordJack;
    private uint passwordAttorney;
    private uint amt;
    /// constructor
    function Will(uint lastdate, uint password1, uint password2) public payable {
        mark = msg.sender;
        deadline = lastdate; //? 
        passwordJack = password1;
        passwordAttorney = password2;
        amt = msg.value;
    }
    
    function jackWithdraw(uint password1, uint password2) public {
        if (now < deadline && password1 == passwordJack && password2 == passwordAttorney) {
            msg.sender.transfer(amt);
        }
    }
    
    function ngoWithdraw(uint password) public {
        if (now > deadline && password == passwordAttorney) {
            msg.sender.transfer(amt);
            selfdestruct(msg.sender);
        }
    }
}

