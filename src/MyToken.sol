//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import {ERC20} from '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20{
    address private defaultAccount = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;
   
    constructor(uint256 initialSupply)  ERC20('MyToken','MTKN'){
        _mint(defaultAccount, initialSupply);
    }

    function getDefaultAccountAddress() external view returns(address){
        return defaultAccount;
    }
}