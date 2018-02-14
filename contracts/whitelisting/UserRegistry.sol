pragma solidity 0.4.18;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";


/**
 * @title UserRegistry
 * @dev The UserRegistry contract has a mapping of users that store contribution limit and  
 * KYC status of each user and which sale it has already signed sales terms 
 */
contract UserRegistry is Ownable {

    event LogUserRegistered(address indexed sender, address indexed newUserAddress, uint256 newLastTimestamp, uint256 newContributionLimit,
                               bool newKYCStatus);
    
    event LogKYCStatusUpdated(address indexed sender, address indexed userAddress, bool newKYCStatus);
    event LogUserAgreedWithTerms(address indexed sender, address _userAddress, address _sale );
    event LogUserContributionLimitUpdated(address indexed sender, address userAddress, uint256 oldLimit, uint256 _newLimit);
    
    event LogDefaultContributionLimitUpdated(address indexed sender, uint256 oldDefault_contribution, uint256 _newDefaultContributionLimit);        
    event LogKYCDurationUpdated(address indexed sender, uint256 oldKYC_duration, uint256 newKYC_duration);

    struct UserInfo {
        uint256 lastCheckTimestamp;
        uint256 contributionLimit;
        bool KYCStatus;
        mapping(address => bool) termsAgreed;
    }

    uint256 public defaultContributionLimit = 10 ether;
    uint256 public kycDuration = 0.5 years;

    mapping(address => UserInfo) public users;

    /**
     * @dev The UserRegistry empty constructor.
     */
    function UserRegistry() public {
    }

    /**
     * @dev Allows to register a new user with the given parameters. It will revert if the user was previously registered or if contributionLimit is 0.
     * @param userAddress The user address to register
     * @param contributionLimit The maximum allowed contrubution for this address
     * @param firstSale The first sale in which this address is allowed to contribute
     */
    function registerUserWithParams(address userAddress, uint256 contributionLimit, address firstSale) 
        public
        onlyOwner
    {
        require(users[userAddress].lastCheckTimestamp == 0); //must be a new user. If user is already in the mapping, revert
        require(contributionLimit > 0);

        UserInfo storage user = users[userAddress];
        user.lastCheckTimestamp = block.timestamp;
        user.contributionLimit = contributionLimit;
        user.KYCStatus = true;

        if (firstSale != 0) {
            user.termsAgreed[firstSale] = true;
        }
        
        LogUserRegistered(msg.sender, userAddress,  users[userAddress].lastCheckTimestamp, 
                           users[userAddress].contributionLimit, users[userAddress].KYCStatus);
    }

    /**
     * @dev Allows to register a new user with default parameters.
     * @param userAddress The user address to register
     */
    function registerUser(address userAddress) 
        public
        onlyOwner
    {
        registerUserWithParams(userAddress, defaultContributionLimit, 0);
    }

    /**
     * @dev Returns user info
     * @param userAddress The user address
     * @param sale Sale address
     * @return KYCStatus user KYC status and it can be true or false.
     * @return contributionLimit User contribution limit.
     * @return termsAgreed True or false if user has agreed with terms
     */
    function getUserInfo(address userAddress, address sale) 
        public
        view
        returns(bool, uint256, bool)
    {
        UserInfo storage user = users[userAddress];

        bool status = block.timestamp - user.lastCheckTimestamp < kycDuration && user.KYCStatus;

        return (
            status,
            user.contributionLimit,
            user.termsAgreed[sale]
        );
    }

    /**
     * @dev Update user KYC status
     * @param userAddress The user address
     * @param status New KYC status
     */
    function updateKYCStatus(address userAddress, bool status) 
        public
        onlyOwner
    {
        require(users[userAddress].lastCheckTimestamp > 0);
        users[userAddress].lastCheckTimestamp = block.timestamp ;
        users[userAddress].KYCStatus = status;

        LogKYCStatusUpdated(msg.sender, userAddress, status);
    }

    /**
     * @dev Set that user agrees with terms
     * @param userAddress The user address
     * @param sale Sale address that user has agreed
     */
    function agreedWithTerms(address userAddress, address sale)
        public
        onlyOwner
    {
        require(users[userAddress].lastCheckTimestamp > 0);

        users[userAddress].termsAgreed[sale] = true;

        LogUserAgreedWithTerms(msg.sender, userAddress, sale);
    }

    /**
     * @dev Set new user's contribution limit
     * @param userAddress The user address
     * @param newContributionlimit New contribution limit in Wei
     */
    function setContributionLimit(address userAddress, uint256 newContributionlimit)
        public
        onlyOwner
    {
        require(users[userAddress].lastCheckTimestamp > 0);
        LogUserContributionLimitUpdated(msg.sender, userAddress, users[userAddress].contributionLimit , newContributionlimit);
        
        users[userAddress].contributionLimit = newContributionlimit;
    }

    /**
     * @dev Set new default contribution limit
     * @param newDefaultContributionLimit New default contribution limit in Wei
     */
    function updateDefaultContributionLimit(uint256 newDefaultContributionLimit)
        public
        onlyOwner
    {
        LogDefaultContributionLimitUpdated(msg.sender, defaultContributionLimit, newDefaultContributionLimit);
        
        defaultContributionLimit = newDefaultContributionLimit;
    }

    /**
     * @dev Set new KYC duration
     * @param newKYCDuration New KYC duration
     */
    function updateKYCDuration(uint256 newKYCDuration)
        public
        onlyOwner
    {
        LogKYCDurationUpdated(msg.sender, kycDuration, newKYCDuration);
        
        kycDuration = newKYCDuration;
    }

}
