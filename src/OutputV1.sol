interface OutputV1 {
    error CannotAddToNullOperator();
    error FeesExceedMax();
    error InputLengthsMustMatch();
    error InsufficientOutputBalance();
    error NotManagerOfOperator();
    error OperatorNotWhitelisted();
    error ValidatorAlreadyAdded();
    error ValidatorNotWhitelisted();
    event DefaultAdminDelayChangeCanceled();
    event DefaultAdminDelayChangeScheduled(
        uint48 newDelay,
        uint48 effectSchedule
    );
    event DefaultAdminTransferCanceled();
    event DefaultAdminTransferScheduled(
        address indexed newAdmin,
        uint48 acceptSchedule
    );
    event Initialized(uint8 version);
    event OperatorAdded(
        string indexed name,
        uint256 indexed serviceFeeBps,
        uint256 indexed validatorFeeBps,
        uint256 validatorAllowance,
        address manager
    );
    event OperatorFeeUpdated(
        uint256 indexed serviceFeeBps,
        uint256 indexed validatorFeeBps,
        uint256 indexed operatorId
    );
    event OperatorWhitelistUpdated(
        uint256 indexed operatorId,
        bool indexed whitelist
    );
    event RoleAdminChanged(
        bytes32 indexed role,
        bytes32 indexed previousAdminRole,
        bytes32 indexed newAdminRole
    );
    event RoleGranted(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event RoleRevoked(
        bytes32 indexed role,
        address indexed account,
        address indexed sender
    );
    event ValidatorAllowanceUpdated(
        uint256 indexed newAllowance,
        uint256 indexed operatorId
    );
    event ValidatorsAdded(uint256 indexed count, uint256 indexed operatorId);
    event ValidatorsFunded(uint256 indexed count, uint256 indexed amount);
    event ValidatorsRedeemed(uint256 indexed count, uint256 indexed amount);
    event ValidatorsStatusUpdated(
        uint256 indexed count,
        bool indexed whitelist,
        bool indexed trackBalance
    );
    event ValidatorsTrackBalanceUpdated(
        uint256 indexed count,
        bool indexed status
    );
    event ValidatorsWhitelistUpdated(
        uint256 indexed count,
        bool indexed status
    );

    function BURNER_ROLE() external view returns (bytes32);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function FEE_RECIPIENT_ROLE() external view returns (bytes32);

    function GOVERNOR_ROLE() external view returns (bytes32);

    function MANAGER_ROLE() external view returns (bytes32);

    function MINTER_ROLE() external view returns (bytes32);

    function PAUSER_ROLE() external view returns (bytes32);

    function REBASER_ROLE() external view returns (bytes32);

    function acceptDefaultAdminTransfer() external;

    function addOperator(
        address manager,
        string memory name,
        uint256 serviceFeeBps,
        uint256 validatorFeeBps,
        uint256 validatorAllowance
    ) external;

    function addValidators(bytes32[] memory addresses, uint256 operatorId)
        external;

    function beginDefaultAdminTransfer(address newAdmin) external;

    function cancelDefaultAdminTransfer() external;

    function changeDefaultAdminDelay(uint48 newDelay) external;

    function computeValidatorHash(bytes32[] memory addresses)
        external
        pure
        returns (bytes32);

    function defaultAdmin() external view returns (address);

    function defaultAdminDelay() external view returns (uint48);

    function defaultAdminDelayIncreaseWait() external view returns (uint48);

    function flip() external view returns (address);

    function fundValidators(
        bytes32[] memory addresses,
        uint256[] memory amounts
    ) external;

    function getCountableValidators() external view returns (bytes32[] memory);

    function getOperatorAddresses(uint256 id)
        external
        view
        returns (address, address);

    function getOperatorCount() external view returns (uint256);

    function getOperatorInfo(uint256 id)
        external
        view
        returns (
            uint96,
            uint96,
            uint16,
            uint16
        );

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function getValidators() external view returns (bytes32[] memory);

    function grantRole(bytes32 role, address account) external;

    function hasRole(bytes32 role, address account)
        external
        view
        returns (bool);

    function initialize(
        address flip_,
        address burnerProxy_,
        address gov_,
        address manager_,
        address stateChainGateway_,
        address rebaser_
    ) external;

    function operators(uint256)
        external
        view
        returns (
            uint96 staked,
            uint96 unstaked,
            uint16 serviceFeeBps,
            uint16 validatorFeeBps,
            bool whitelisted,
            uint8 validatorAllowance,
            address manager,
            address feeRecipient,
            string memory name
        );

    function owner() external view returns (address);

    function pendingDefaultAdmin()
        external
        view
        returns (address newAdmin, uint48 schedule);

    function pendingDefaultAdminDelay()
        external
        view
        returns (uint48 newDelay, uint48 schedule);

    function redeemValidators(bytes32[] memory addresses) external;

    function renounceRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function rollbackDefaultAdminDelay() external;

    function setOperatorFee(
        uint256 serviceFeeBps,
        uint256 validatorFeeBps,
        uint256 operatorId
    ) external;

    function setOperatorValidatorAllowance(
        uint256 allowance,
        uint256 operatorId
    ) external;

    function setOperatorWhitelist(uint256 operatorId, bool whitelist) external;

    function setValidatorsStatus(
        bytes32[] memory addresses,
        bool whitelist,
        bool trackBalance
    ) external;

    function setValidatorsTrackBalance(
        bytes32[] memory addresses,
        bool trackBalance
    ) external;

    function setValidatorsWhitelist(bytes32[] memory addresses, bool whitelist)
        external;

    function stateChainGateway() external view returns (address);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function validatorAddressHash() external view returns (bytes32);

    function validatorAddresses(uint256) external view returns (bytes32);

    function validators(bytes32)
        external
        view
        returns (
            uint8 operatorId,
            bool whitelisted,
            bool trackBalance
        );

    function wrappedBurnerProxy() external view returns (address);

    function wrappedRebaserProxy() external view returns (address);
}