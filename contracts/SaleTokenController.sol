pragma solidity 0.4.19;

import "@tokenfoundry/sale-contracts/contracts/Sale.sol";
import "./TokenControllerI.sol";

/// @title Abstract contract for sale token controllers.
/// The controller specifies whether a transfer can be done.
contract SaleTokenController is TokenControllerI {

    Sale sale;

    function SaleTokenController(Sale _sale) public {
        sale = _sale;
    }

    /// @dev Specifies whether a transfer is allowed or not
    /// @dev (overwrites method in TokenControllerI).
    /// @return True if the transfer is allowed
    function transferAllowed(address _from, address _to) external view returns (bool) {
        if (!hasContributedToPolicy(msg.sender) && sale.hasContributed[msg.sender]) {
            return false;
        } else {
            return true;
        }
    }

    ///@dev Specifies whether a sale contibutor has contributed to the team's policy
    ///@return True if they have
    function hasContributedToPolicy(address contributor) internal view returns (bool);
    
}
