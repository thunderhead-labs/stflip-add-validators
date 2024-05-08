// SPDX-License-Identifier: UNLICENSED
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.8.0. SEE SOURCE BELOW. !!

interface RebaserV1 {
    error AprTooHigh(uint256 apr);
    error ExcessiveFeeClaim();
    error InputLengthsMustMatch();
    error NotFeeRecipientOrManager();
    error RebaseTooSoon();
    error SupplyDecreaseTooHigh(uint256 decrease);
    error ValidatorAddressesDoNotMatch();
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
    event FeeClaim(
        address feeRecipient,
        uint256 indexed amount,
        bool indexed receivedFlip,
        uint256 indexed operatorId
    );
    event Initialized(uint8 version);
    event NewAprThreshold(uint256 indexed newAprThreshold);
    event NewRebaseInterval(uint256 indexed newRebaseInterval);
    event NewSlashThreshold(uint256 indexed newSlashThreshold);
    event RebaserRebase(
        uint256 indexed apr,
        uint256 indexed stateChainBalance,
        uint256 previousSupply,
        uint256 indexed newSupply
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

    function BURNER_ROLE() external view returns (bytes32);

    function DEFAULT_ADMIN_ROLE() external view returns (bytes32);

    function FEE_RECIPIENT_ROLE() external view returns (bytes32);

    function GOVERNOR_ROLE() external view returns (bytes32);

    function MANAGER_ROLE() external view returns (bytes32);

    function MINTER_ROLE() external view returns (bytes32);

    function PAUSER_ROLE() external view returns (bytes32);

    function REBASER_ROLE() external view returns (bytes32);

    function acceptDefaultAdminTransfer() external;

    function aprThresholdBps() external view returns (uint16);

    function beginDefaultAdminTransfer(address newAdmin) external;

    function cancelDefaultAdminTransfer() external;

    function changeDefaultAdminDelay(uint48 newDelay) external;

    function claimFee(
        uint256 amount,
        bool max,
        bool receiveFlip,
        uint256 operatorId
    ) external;

    function claimServiceFee(
        uint256 amount,
        bool max,
        bool receiveFlip
    ) external;

    function defaultAdmin() external view returns (address);

    function defaultAdminDelay() external view returns (uint48);

    function defaultAdminDelayIncreaseWait() external view returns (uint48);

    function flip() external view returns (address);

    // function getOperators() external view returns (RebaserV1.Operator[] memory);

    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    function grantRole(bytes32 role, address account) external;

    function hasRole(bytes32 role, address account)
        external
        view
        returns (bool);

    function initialize(
        address[8] memory addresses,
        uint256 aprThresholdBps_,
        uint256 slashThresholdBps_,
        uint256 rebaseInterval_
    ) external;

    function lastRebaseTime() external view returns (uint32);

    function operators(uint256)
        external
        view
        returns (
            uint88 rewards,
            uint80 pendingFee,
            uint88 slashCounter
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

    function rebase(
        uint256 epoch,
        uint256[] memory validatorBalances,
        bytes32[] memory addresses,
        bool takeFee
    ) external;

    function rebaseInterval() external view returns (uint32);

    function renounceRole(bytes32 role, address account) external;

    function revokeRole(bytes32 role, address account) external;

    function rollbackDefaultAdminDelay() external;

    function servicePendingFee() external view returns (uint80);

    function setAprThresholdBps(uint256 aprThresholdBps_) external;

    function setRebaseInterval(uint256 rebaseInterval_) external;

    function setSlashThresholdBps(uint256 slashThresholdBps_) external;

    function slashThresholdBps() external view returns (uint16);

    function stflip() external view returns (address);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function totalOperatorPendingFee() external view returns (uint80);

    function wrappedBurnerProxy() external view returns (address);

    function wrappedMinterProxy() external view returns (address);

    function wrappedOutputProxy() external view returns (address);
}

// interface RebaserV1 {
//     struct Operator {
//         uint88 rewards;
//         uint80 pendingFee;
//         uint88 slashCounter;
//     }
// }

// THIS FILE WAS AUTOGENERATED FROM THE FOLLOWING ABI JSON:
/*
[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint256","name":"apr","type":"uint256"}],"name":"AprTooHigh","type":"error"},{"inputs":[],"name":"ExcessiveFeeClaim","type":"error"},{"inputs":[],"name":"InputLengthsMustMatch","type":"error"},{"inputs":[],"name":"NotFeeRecipientOrManager","type":"error"},{"inputs":[],"name":"RebaseTooSoon","type":"error"},{"inputs":[{"internalType":"uint256","name":"decrease","type":"uint256"}],"name":"SupplyDecreaseTooHigh","type":"error"},{"inputs":[],"name":"ValidatorAddressesDoNotMatch","type":"error"},{"anonymous":false,"inputs":[],"name":"DefaultAdminDelayChangeCanceled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint48","name":"newDelay","type":"uint48"},{"indexed":false,"internalType":"uint48","name":"effectSchedule","type":"uint48"}],"name":"DefaultAdminDelayChangeScheduled","type":"event"},{"anonymous":false,"inputs":[],"name":"DefaultAdminTransferCanceled","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"newAdmin","type":"address"},{"indexed":false,"internalType":"uint48","name":"acceptSchedule","type":"uint48"}],"name":"DefaultAdminTransferScheduled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"feeRecipient","type":"address"},{"indexed":true,"internalType":"uint256","name":"amount","type":"uint256"},{"indexed":true,"internalType":"bool","name":"receivedFlip","type":"bool"},{"indexed":true,"internalType":"uint256","name":"operatorId","type":"uint256"}],"name":"FeeClaim","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint8","name":"version","type":"uint8"}],"name":"Initialized","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"newAprThreshold","type":"uint256"}],"name":"NewAprThreshold","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"newRebaseInterval","type":"uint256"}],"name":"NewRebaseInterval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"newSlashThreshold","type":"uint256"}],"name":"NewSlashThreshold","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"uint256","name":"apr","type":"uint256"},{"indexed":true,"internalType":"uint256","name":"stateChainBalance","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"previousSupply","type":"uint256"},{"indexed":true,"internalType":"uint256","name":"newSupply","type":"uint256"}],"name":"RebaserRebase","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"previousAdminRole","type":"bytes32"},{"indexed":true,"internalType":"bytes32","name":"newAdminRole","type":"bytes32"}],"name":"RoleAdminChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"bytes32","name":"role","type":"bytes32"},{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":true,"internalType":"address","name":"sender","type":"address"}],"name":"RoleRevoked","type":"event"},{"inputs":[],"name":"BURNER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"DEFAULT_ADMIN_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"FEE_RECIPIENT_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"GOVERNOR_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"MANAGER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"MINTER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"PAUSER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"REBASER_ROLE","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"acceptDefaultAdminTransfer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"aprThresholdBps","outputs":[{"internalType":"uint16","name":"","type":"uint16"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newAdmin","type":"address"}],"name":"beginDefaultAdminTransfer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"cancelDefaultAdminTransfer","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint48","name":"newDelay","type":"uint48"}],"name":"changeDefaultAdminDelay","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"bool","name":"max","type":"bool"},{"internalType":"bool","name":"receiveFlip","type":"bool"},{"internalType":"uint256","name":"operatorId","type":"uint256"}],"name":"claimFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"bool","name":"max","type":"bool"},{"internalType":"bool","name":"receiveFlip","type":"bool"}],"name":"claimServiceFee","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"defaultAdmin","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"defaultAdminDelay","outputs":[{"internalType":"uint48","name":"","type":"uint48"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"defaultAdminDelayIncreaseWait","outputs":[{"internalType":"uint48","name":"","type":"uint48"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"flip","outputs":[{"internalType":"contract IERC20","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getOperators","outputs":[{"components":[{"internalType":"uint88","name":"rewards","type":"uint88"},{"internalType":"uint80","name":"pendingFee","type":"uint80"},{"internalType":"uint88","name":"slashCounter","type":"uint88"}],"internalType":"struct RebaserV1.Operator[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"}],"name":"getRoleAdmin","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"grantRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"hasRole","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address[8]","name":"addresses","type":"address[8]"},{"internalType":"uint256","name":"aprThresholdBps_","type":"uint256"},{"internalType":"uint256","name":"slashThresholdBps_","type":"uint256"},{"internalType":"uint256","name":"rebaseInterval_","type":"uint256"}],"name":"initialize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"lastRebaseTime","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"operators","outputs":[{"internalType":"uint88","name":"rewards","type":"uint88"},{"internalType":"uint80","name":"pendingFee","type":"uint80"},{"internalType":"uint88","name":"slashCounter","type":"uint88"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pendingDefaultAdmin","outputs":[{"internalType":"address","name":"newAdmin","type":"address"},{"internalType":"uint48","name":"schedule","type":"uint48"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pendingDefaultAdminDelay","outputs":[{"internalType":"uint48","name":"newDelay","type":"uint48"},{"internalType":"uint48","name":"schedule","type":"uint48"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"epoch","type":"uint256"},{"internalType":"uint256[]","name":"validatorBalances","type":"uint256[]"},{"internalType":"bytes32[]","name":"addresses","type":"bytes32[]"},{"internalType":"bool","name":"takeFee","type":"bool"}],"name":"rebase","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"rebaseInterval","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"renounceRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes32","name":"role","type":"bytes32"},{"internalType":"address","name":"account","type":"address"}],"name":"revokeRole","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"rollbackDefaultAdminDelay","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"servicePendingFee","outputs":[{"internalType":"uint80","name":"","type":"uint80"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"aprThresholdBps_","type":"uint256"}],"name":"setAprThresholdBps","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"rebaseInterval_","type":"uint256"}],"name":"setRebaseInterval","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"slashThresholdBps_","type":"uint256"}],"name":"setSlashThresholdBps","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"slashThresholdBps","outputs":[{"internalType":"uint16","name":"","type":"uint16"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"stflip","outputs":[{"internalType":"contract stFlip","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"totalOperatorPendingFee","outputs":[{"internalType":"uint80","name":"","type":"uint80"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"wrappedBurnerProxy","outputs":[{"internalType":"contract BurnerV1","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"wrappedMinterProxy","outputs":[{"internalType":"contract MinterV1","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"wrappedOutputProxy","outputs":[{"internalType":"contract OutputV1","name":"","type":"address"}],"stateMutability":"view","type":"function"}]
*/