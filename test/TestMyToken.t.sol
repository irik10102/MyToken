//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Test, console} from 'forge-std/Test.sol';
import {MyToken} from 'src/MyToken.sol';

import {DeployMyToken} from 'script/DeployMyToken.s.sol';
import {Vm} from 'forge-std/Vm.sol';


 
contract TestMyToken is Test {
    MyToken internal myToken;
    address private bob;
    address private alice;
    address private defaultSender;
    uint256 private constant TRANSFER_AMOUNT = 100 ether;
    uint256 private constant SPEND_AMOUNT = 10 ether;

    function setUp() external{ 
        DeployMyToken deployMyToken = new DeployMyToken();
        myToken = deployMyToken.run();
        bob = makeAddr('bob');
        alice = makeAddr('alice');
        defaultSender = myToken.getDefaultAccountAddress();

    }

    function testNameOfToken() external{
        assertEq('MyToken', myToken.name());
    }

    function testSymbolOfToken() external{
        assertEq('MTKN', myToken.symbol());
    }

    function testTotalSupply() external{

        assertEq(1000*(10**myToken.decimals()), myToken.totalSupply());
        assertEq(myToken.balanceOf(myToken.getDefaultAccountAddress()), myToken.totalSupply());
    }

    function testTransferConsistency() external{
        //Transfer ALICE -> BOB
        //ARRANGE
        
        console.log('The msg.sender now is:', address(msg.sender));
        console.log('The address(this) now is:', address(this));
        console.log('The address of the MyToken.sol contract is:', address(myToken));
        console.log('The address of the defaultAccount:', defaultSender);

        vm.startPrank(defaultSender);

        myToken.transfer(alice, TRANSFER_AMOUNT);
        myToken.transfer(bob, TRANSFER_AMOUNT);
        vm.stopPrank();

        uint256 consistentBalance = myToken.balanceOf(alice) + myToken.balanceOf(bob);

        //ACT
        vm.prank(alice);
        myToken.transfer(bob, 10 ether);

        //ASSERT
        assertEq(myToken.balanceOf(alice), TRANSFER_AMOUNT - SPEND_AMOUNT); 
        assertEq(myToken.balanceOf(bob), TRANSFER_AMOUNT + SPEND_AMOUNT);
        assertEq(consistentBalance, myToken.balanceOf(alice)+ myToken.balanceOf(bob));
       
        //assertEq(0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496 , address(myToken));

    }

    /**
     * purpose of this test is to set allowance for alice to transfer some of her funds to bob and then we gonna verify it.
     */
    function testAllowance() external{
        //ARRANGE
        vm.prank(defaultSender);

        vm.recordLogs();

        //ACT
        //Allowance event is triggered
        myToken.approve(alice, TRANSFER_AMOUNT); 
        
        assert(myToken.allowance(defaultSender, alice)==TRANSFER_AMOUNT);

        //Transfer event is triggered
        vm.prank(alice);
        myToken.transferFrom(defaultSender, bob, SPEND_AMOUNT); //Alice spending on behalf of defaultAccount to give SPEND_AMOUNT amount of MyToken to Bob.
       

        Vm.Log[] memory entries = vm.getRecordedLogs();
        //console.log_named_array(entries);
        
        //ASSERT
         uint256 currentApproveEventAmt = abi.decode(entries[0].data, (uint256));
         uint256 currentTransferEventAmt = abi.decode(entries[1].data, (uint256));

        

        assert(currentApproveEventAmt-currentTransferEventAmt ==  myToken.allowance(defaultSender, alice));
        assert(currentTransferEventAmt == myToken.balanceOf(bob));
        assert(myToken.balanceOf(bob) == SPEND_AMOUNT);
    }

    function testApproveMinusValue() external{

       
    }


}