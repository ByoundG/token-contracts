pragma solidity 0.4.18;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


contract Whitelistable is Ownable {
    
    event LogUserRegistered(address indexed sender, address indexed userAddress);
    event LogUserUnregistered(address indexed sender, address indexed userAddress);
    
    mapping(address => bool) public whitelisted;

    function registerUser(address userAddress) 
        public 
        onlyOwner 
    {
        require(userAddress != 0);
        whitelisted[userAddress] = true;
        LogUserRegistered(msg.sender, userAddress);
    }

    function unregisterUser(address userAddress) 
        public 
        onlyOwner 
    {
        require(whitelisted[userAddress] == true);
        whitelisted[userAddress] = false;
        LogUserUnregistered(msg.sender, userAddress);
    }
}
