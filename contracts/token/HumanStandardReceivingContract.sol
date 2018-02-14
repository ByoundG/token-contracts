pragma solidity 0.4.18;
/*
This is an example contract that helps test the functionality of the approveAndCall() functionality of HumanStandardToken.sol.
This one assumes successful receival of approval.
*/
contract HumanStandardReceivingContract {

    event ReceivedApproval(uint256 _value);

    /// @dev Human Standard  function that will handle incoming token transfers.
    /// @param _from  Token sender address.
    /// @param _value Amount of tokens.
    /// @param _tokenContract Token address.
    /// @param _extraData  Transaction metadata.
    function receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData) public;

}
