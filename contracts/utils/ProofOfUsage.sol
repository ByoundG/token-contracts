pragma solidity 0.4.18;

import "./ProofOfUsageInterface.sol";

/// @title proof is some addres use a function contract.
contract ProofOfUsage is ProofOfUsageInterface {
        

        /// @dev event triggered when some address use a function.
        /// @param _who who used the function.
        /// @param _function function signature.
        event WasUsed(address indexed _who, bytes4 indexed _function);

        mapping (address => bool) public wasUsed;

        modifier used() {
        _;
        wasUsed[msg.sender] = true;
        WasUsed(msg.sender, msg.sig);
        }

        /// @dev return true if any address use a function.
        /// @param user who used the function.
        function isUsed(address user) public view returns (bool){
            return wasUsed[user];
        }

}