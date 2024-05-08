// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {RebaserV1} from "../src/RebaserV1.sol";
import "forge-std/console.sol";

contract ClaimFeeScript is Script {
    function setUp() public {}
    
    RebaserV1 rebaser = RebaserV1(0x695D1ce0E1Dd5Fca03Bed74c35A407BdEE06636a);


    function run() public {
        
        // Select amount to claim
        uint256 amount = 0;
        // Select true if you'd like to claim all regardless of amount selected
        bool max = true;
        // Select true if you'd like to claim FLIP 
        bool receiveFlip = true;
        // Select your operator ID. 2: Chorus One, 3: Pier Two, 4: Staked, 5: Cumps
        uint256 operatorId = 4;


        (, uint256 pendingFee, ) = rebaser.operators(operatorId);

        console.log("Operator ID: ", operatorId, " can claim FLIP amount: ", pendingFee /10**18);
	vm.startBroadcast();
        rebaser.claimFee(amount, max, receiveFlip, operatorId);
	vm.stopBroadcast();    
}
}
