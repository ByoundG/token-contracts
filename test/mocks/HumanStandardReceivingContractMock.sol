pragma solidity 0.4.18;
/*
This is an example contract that helps test the functionality of the approveAndCall() functionality of HumanStandardToken.sol.
This one assumes successful receival of approval.
*/
contract HumanStandardReceivingContractMock {
    /* A Generic receiving function for contracts that accept tokens */
    address public from;
    uint256 public value;
    address public tokenContract;
    bytes public extraData;

    event ReceivedApproval(uint256 _value);

    /// @dev Human Standard  function that will handle incoming token transfers.
    /// @param _from  Token sender address.
    /// @param _value Amount of tokens.
    /// @param _tokenContract Token address.
    /// @param _extraData  Transaction metadata.
    function receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData) public {
        from = _from;
        value = _value;
        tokenContract = _tokenContract;
        extraData = _extraData;
        ReceivedApproval(_value);
    }
}
