pragma solidity 0.4.19;


/// @title Interface for token controllers. The controller specifies if a transfer can be done.
contract TokenControllerI {

    /// @dev Specifies if a transfer is allowed or not.
    /// @return True if the transfer is allowed
    function transferAllowed(address _from, address _to) external view returns (bool);
}
