pragma solidity 0.4.19;

import "./TokenControllerI.sol";


/// @title Interface for token controllers. The controller specifies if a transfer can be done.
contract SaleTokenController is TokenControllerI {

    address public saleAddress;

    function SaleTokenController(address _saleAddress) public {
        require(saleAddress != 0);

        saleAddress = _saleAddress;
    }

    /// @dev Specifies if a transfer is allowed or not.
    /// @return True if the transfer is allowed
    function transferAllowed(address _from, address _to) external view returns (bool) {
        return _from == saleAddress;
    }
}
