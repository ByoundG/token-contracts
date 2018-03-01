pragma solidity 0.4.19;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/// @title EnforceProtocol contract to enforce use some function to any especific address.
contract EnforceProtocol is Ownable {
    address public protocolAddress;

    event NewProtocolAddress();

    modifier toProtocol(address _to) {
        require(_to == protocolAddress);
        _;
    }
    
    /// @dev Constructor that sets the addres to enforce.
    /// @param _protocolAddress address to be enforced.
    function EnforceProtocol(address _protocolAddress) public {
        protocolAddress = _protocolAddress;
    }

    function setProtocolAddress(address _newProtocolAddress) public onlyOwner {
        require(_newProtocolAddress != address(0));
        protocolAddress = _newProtocolAddress;
        NewProtocolAddress();
    }
}
