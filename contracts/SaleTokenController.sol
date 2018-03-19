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
        return (!sale.hasContributed[_from] || recipientAllowed(_to) || hasUsedProtocol(_from));
    }

    ///@dev Specifies whether a sale contibutor has contributed to the team's protocol
    ///@return True if they have ( they can now transfer their token )
    function hasUsedProtocol(address contributor) internal view returns (bool);

    ///@dev Specifies whether a recipient of a transfer is allowed
    ///@dev this allows the possibility of allowing transfers to the team's protocol
    function recipientAllowed(address recipient) internal view returns (bool);

}
