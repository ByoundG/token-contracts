pragma solidity 0.4.19;


/// @title interface to proof is some addres use a function contract.
contract ProofOfUsageInterface {
    /// @dev event triggered when some address use a function.
    /// @param _who who used the function.
    /// @param _function function signature.
    event WasUse(address indexed _who, bytes4 indexed _function);

    /// @dev return true if any address use a function.
    /// @param user who used the function.
    function usedOf(address user) public view returns (bool);
}