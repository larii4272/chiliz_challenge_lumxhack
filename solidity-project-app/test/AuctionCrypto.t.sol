// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AuctionCrypto} from "../src/AuctionCrypto.sol";

contract AuctionCryptoTest is Test {
    AuctionCrypto public auction;

    function setUp() public {
        auction = new AuctionCrypto();
    }
}
