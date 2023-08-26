// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    error NotWinner();
    error NotEnded();
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

    uint256 endTime;
    uint256 highestDeposit;
    address winner;

    function bet() public payable {
        // your code here
        if (msg.value > highestDeposit) {
            highestDeposit = msg.value;
            winner = msg.sender;
            endTime = block.timestamp + 3600 seconds;
        }
    }

    function claimPrize() public {
        // your code here
        if (msg.sender != winner) {
            revert NotWinner();
        }
        if (endTime > block.timestamp) {
            revert NotEnded();
        }
        payable(msg.sender).transfer(address(this).balance);
    }
}
