pragma solidity 0.4.18;

import "./ProofOfUsageInterface.sol";

/// @title proof is some addres use a function contract.
contract ProofOfUsage is ProofOfUsageInterface {
    mapping (address => bool) public isUsed;

    modifier used(address _who) {
        _;
        isUsed[_who] = true;
        WasUse(_who, msg.sig);
    }       

    /// @dev return true if any address use a function.
    /// @param user who used the function.
    function usedOf(address user) public view returns (bool) {
        return isUsed[user];
    }
}