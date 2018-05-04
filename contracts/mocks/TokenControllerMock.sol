pragma solidity 0.4.23;

import "../TokenControllerI.sol";


contract TokenControllerMock is TokenControllerI {
    mapping(address => bool) allowed;
    
    constructor() public {
    
    } 

    function transferAllowed(address _from, address) external view returns (bool) {
        return allowed[_from];
    }

    function setAllowed(address user) public {
        allowed[user] = true;
    }

}
