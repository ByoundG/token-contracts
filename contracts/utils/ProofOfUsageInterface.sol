pragma solidity 0.4.18;


/// @title interface to proof is some addres use a function contract.
contract ProofOfUsageInterface {
        /// @dev return true if any address use a function.
        /// @param user who used the function.
        function isUsed(address user) public view returns (bool);
}