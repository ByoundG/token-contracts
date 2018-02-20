pragma solidity 0.4.18;

import "truffle/Assert.sol";
import "./mocks/ProofOfUsageMock.sol";

contract TestProofOfUsageContract {
  ProofOfUsageMock proofOfUsage;

  function beforeEach() public {
    proofOfUsage = new ProofOfUsageMock();
  }

  function testProofOfUsageContract() public{
    proofOfUsage.testProofOfUsage();

    Assert.equal(proofOfUsage.sender(), address(this), 'Sender should be correct');
    //Assert.equal(receiver.funct(), data, 'Data should be correct');
  }

}
