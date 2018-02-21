pragma solidity 0.4.18;

import "truffle/Assert.sol";
import "../contracts/example/ExampleToken.sol";
import "./mocks/HumanStandardReceivingContractMock.sol";

contract TestHumanStandardReceivingContract {
    ExampleToken token;
    HumanStandardReceivingContractMock receiver;

    function beforeEach() public {
        token = new ExampleToken();
        receiver = new HumanStandardReceivingContractMock();
        token.mint(address(this), 100);
    }

    function testTransferToHumanTokenContract() public {
        bytes memory data = "Hola Mundo";
        token.approveAndCall(receiver, 10, data);

        Assert.equal(receiver.from(), address(this), 'Sender should be correct');
        Assert.equal(receiver.value(), 10, 'Value should be correct');
        Assert.equal(receiver.tokenContract(), address(token), 'Token address should be correct');
        //Assert.equal(receiver.extraData(), data, 'Data should be correct');
    }
}
