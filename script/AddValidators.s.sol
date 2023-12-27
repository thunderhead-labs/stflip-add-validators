// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {OutputV1} from "../src/OutputV1.sol";

contract AddValidatorsScript is Script {
    function setUp() public {}
    
    OutputV1 output = OutputV1(0x6345A9F7e7069D478FFF3595f1522f28d8405151);


    function run() public {

        bytes32[] memory validators = new bytes32[](10);

        validators[0] = 0x046fcb1ac0dab03f7882e782182b02eb5214c990c0c0658f40777dd824065929;
        validators[1] = 0x545b5090ce71b4a092475eb89c227cd3aa8c6ba9df040f76b3b8ef8157376f21;
        validators[2] = 0x961b86fc1dfbc2ba6339fd96fc948b5a76ba2cc4399a398eb52202cd50a3c57b;
        validators[3] = 0x68c46702ecb135b1c2ff2ed01db1c9f1f20635def7bc73f0687db8907eee2b57;
        validators[4] = 0xa26bebef22fb07dcfca967c1dca4ea5300cc3e9d96036218293df48d3ed95723;
        validators[5] = 0x729d6697febdb521597357fce7b9a0776e1b789ffbda61dea03e5f17a7b1f174;
        validators[6] = 0xf62a514669679a5c9a5a2ce6396bba90203357e644cc4fb1305fecf786dcab05;
        validators[7] = 0x605054349242d6454818fc0223e455fee702f440d728ede28ad417c5b4ecb412;
        validators[8] = 0x2a83183fd8169e48ec5ab66f2917535a351d4ed0b10a2c8b52325ac47d9ce871;
        validators[9] = 0xe01150d94d2e8ebc86f99756b600a461e9169c2a64324ce81b47827ca530a813;

        vm.broadcast();
            output.addValidators(validators, 2);
        
        
        for (uint i = 49; i < 59; i++) {
            require(output.validatorAddresses(i) == validators[i - 49], "validator not added");
        }

        for (uint i = 0; i < 10; i++) {
            (uint id,,) = output.validators(validators[i]);
            require(id == 2, "validator not added");
        }
    }
}
