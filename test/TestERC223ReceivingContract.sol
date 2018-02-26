pragma solidity 0.4.19;

import "truffle/Assert.sol";
import "../contracts/mocks/ERC223BasicTokenMock.sol";
import "../contracts/mocks/ERC223ReceivingContractMock.sol";


contract TestERC223ReceivingContract {
    ERC223BasicTokenMock token;
    ERC223ReceivingContractMock receiver;

    function beforeEach() public {
        token = new ERC223BasicTokenMock(this, 100);
        receiver = new ERC223ReceivingContractMock();
    }

    function testTransferToERC223TokenContract() public {
        bytes memory data = "Hola Mundo";
        token.transfer(receiver, 10, data);

        Assert.equal(receiver.sender(), address(this), 'Sender should be correct');
        Assert.equal(receiver.value(), 10, 'Value should be correct');
      //Assert.equal(receiver.data(), data, 'Data should be correct');
    }
}
