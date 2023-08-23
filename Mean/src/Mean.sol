// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Mean {
    /**
     * The goal of this exercise is to return the mean of the numbers in "arr"
     */
    function mean(uint256[] calldata arr) public view returns (uint256) {
        // your code here
        uint256 len = arr.length;
        uint256 total;
        uint256 mean;
        for (uint256 i = 0; i < len; i++) {
            total += arr[i];
            mean = total / len;
        }
        return mean;
    }
}
