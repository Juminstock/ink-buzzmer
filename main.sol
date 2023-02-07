// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.0 < 0.9.0;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Acesso is AccessControl {

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_USER = keccak256("ROL_USER");

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
    }

    function soloAdmin() public {
        require(hasRole(ROL_ADMIN, msg.sender), "Esta funcion solo puede ser usada por el admin.");
    }

    function soloUser() public {
        require(hasRole(ROL_USER, msg.sender), "Esta funcion solo puede ser usada por el user.");
    }

    function agregarRol(bytes32 rol, address account) public {
        require(hasRole(ROL_ADMIN, msg.sender), "Esta funcion solo puede ser usada por el admin.");

        _grantRole(rol, account);
    }
}