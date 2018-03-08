pragma solidity 0.4.19;

import "../TokenControllerI.sol";


contract TokenControllerMock is TokenControllerI {
    mapping(address => bool) allowed;
    
    function TokenControllerMock() public {
    
    } 

    function transferAllowed(address _from, address) external view returns (bool) {
        return allowed[_from];
    }

    function setAllowed(address user) public {
        allowed[user] = true;
    }

}
