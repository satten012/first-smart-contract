// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyShop {

    //0xd9145CCE52D386f254917e481eB44e9943F39138
    address public owner; /* видная переменная  */
    mapping (address => uint) public payments;


    constructor(){  /* произойдет вызов автомат когда контракт будет размещен в блокчейн */
        owner = msg.sender;  /* вернет адресс отправителю сохраняются в блокчейне*/
    }
    function payForItem() public payable  { /* payble функция принимает деньги, зачисление деньги */
        /* сохраняем информацию кто прислал деньги */
        payments[msg.sender] = msg.value;
    }

    function withdrawAll() public {
        address payable _to = payable (owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }    
}