// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {OutputV1} from "../src/OutputV1.sol";

contract AddValidatorsScript is Script {
    function setUp() public {}
    
    OutputV1 output = OutputV1(0x6345A9F7e7069D478FFF3595f1522f28d8405151);


    function run() public {

        bytes32[] memory validators = new bytes32[](1);

        validators[0] = 0xc0cd0e8b17491dffe308a59ada985fcc99b6e309d76b6403d6732c8dd5924e36;

        vm.broadcast();
            output.addValidators(validators, 5);
        
        
        for (uint i = 0; i < 5; i++) {
            (uint id,,) = output.validators(validators[i]);
            require(id == 5, "validator not added");
        }
    }
}
