//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {Script} from 'forge-std/Script.sol';

import {MyToken} from 'src/MyToken.sol';

contract DeployMyToken is Script{
    MyToken internal myToken ;
    function run() external returns(MyToken){
        vm.startBroadcast();
            myToken = new MyToken(10000 ether); //1000e18 number of tokens are in total supply
        vm.stopBroadcast();
        return myToken;

    }
}