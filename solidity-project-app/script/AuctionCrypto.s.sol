// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {AuctionCrypto} from "../src/AuctionCrypto.sol";

contract AuctionCryptoScript is Script {
    function setUp() public {}

    function run() public returns (AuctionCrypto auction) {
        // load variables from envinronment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // deploying the contract
        vm.startBroadcast(deployerPrivateKey);

        auction = new AuctionCrypto();

        vm.stopBroadcast();
    }
}
