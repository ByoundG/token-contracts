pragma solidity 0.4.19;

import '../../contracts/utils/ProofOfUsage.sol';

 /*
 * Contract that is working with ProofOfUsage
 */

contract ProofOfUsageMock is ProofOfUsage {
    address public sender;
    bytes4 public funct;

    // just store sender and function signature to compare it
    function testProofOfUsage() 
        public
        used(msg.sender)
    {
        sender = msg.sender;
        funct = msg.sig;
    }
}
