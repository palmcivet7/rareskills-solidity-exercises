// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    error InsufficientBalance();
    error InsufficientTime();
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    mapping(address => uint256) public balances;
    uint256 public lastDeposit;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[user];
    }

    function depositEther() external payable {
        /// add code here
        balances[msg.sender] += msg.value;
        lastDeposit = block.timestamp;
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance();
        }
        if (block.timestamp < lastDeposit + 7 days) {
            revert InsufficientTime();
        }
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
