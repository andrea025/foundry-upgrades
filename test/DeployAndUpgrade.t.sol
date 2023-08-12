// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {StdCheats} from "forge-std/StdCheats.sol";
import {Test, console} from "forge-std/Test.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {DeployBox} from "script/DeployBox.s.sol";
import {UpgradeBox} from "script/UpgradeBox.s.sol";
import {BoxV1} from "src/BoxV1.sol";
import {BoxV2} from "src/BoxV2.sol";

contract DeployAndUpgradeTest is StdCheats, Test {
    DeployBox public deployBox;
    UpgradeBox public upgradeBox;

    function setUp() public {
        deployBox = new DeployBox();
        upgradeBox = new UpgradeBox();
    }

    function test_BoxWorks() public {
        address proxyAddress = deployBox.deployBox();
        uint256 expectedNumber = 1;
        assertEq(expectedNumber, BoxV1(proxyAddress).version());
    }

    function test_DeploymentIsV1() public {
        address proxyAddress = deployBox.deployBox();
        uint256 expectedNumber = 7;
        vm.expectRevert();
        BoxV2(proxyAddress).setNumber(expectedNumber);
    }

    function test_UpgradeWorks() public {
        address proxyAddress = deployBox.deployBox();

        BoxV2 box2 = new BoxV2();

        vm.prank(BoxV1(proxyAddress).owner());
        BoxV1(proxyAddress).transferOwnership(msg.sender);

        address proxy = upgradeBox.upgradeBox(proxyAddress, address(box2));

        uint256 expectedNumber = 2;
        assertEq(expectedNumber, BoxV2(proxy).version());

        BoxV2(proxy).setNumber(expectedNumber);
        assertEq(expectedNumber, BoxV2(proxy).getNumber());
    }
}
