// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {OutputV1} from "../src/OutputV1.sol";

contract AddValidatorsScript is Script {
    function setUp() public {}
    
    OutputV1 output = OutputV1(0x6345A9F7e7069D478FFF3595f1522f28d8405151);


    function run() public {

        bytes32[] memory validators = new bytes32[](5);

        validators[0] = 0x60f03a3333f330f640f7de07a75567d0a464def8dacf39896d4bcd1d21216d7a;
        validators[1] = 0x5202cc1c9536726191ad17f83e46644faf25c2aaa767fbcefb0370b6c6993f1d;
        validators[2] = 0x2895a35ffb7c38fc25a3529e81d6c9a72c56fae28338791e6a55d25d9ced181d;
        validators[3] = 0x3692bef51b2c82517585f7040b7ffca74272c1f35d2e351a6b081c71d3645414;
        validators[4] = 0x70a6a7438471ac5e4b777de7b62d0426e9b03310cb0d69ad57860d9a590da040;

        vm.broadcast();
            output.addValidators(validators, 4);
        
        
        //for (uint i = 49; i < 59; i++) {
          //  require(output.validatorAddresses(i) == validators[i - 49], "validator not added");
        //}

        for (uint i = 0; i < 10; i++) {
            (uint id,,) = output.validators(validators[i]);
            require(id == 4, "validator not added");
        }
    }
}
