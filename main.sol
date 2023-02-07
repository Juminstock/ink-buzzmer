// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.0 < 0.9.0;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Acesso is AccessControl {

    bytes32 public constant Rol_Owner = keccak256("Rol_Owner");
    bytes32 public constant Rol_User = keccak256("Rol_User");

    constructor() {
        _grantRole(Rol_Owner, msg.sender);
    }

    function soloOwner() public {
        require(hasRole(Rol_Owner, msg.sender), "Esta funcion solo puede ser usada por el propietario.");
    }

    function soloUser() public {
        require(hasRole(Rol_User, msg.sender), "Esta funcion solo puede ser usada por el usuario.");
    }

    function agregarRol(bytes32 rol, address account) public {
        require(hasRole(Rol_Owner, msg.sender), "Esta funcion solo puede ser usada por el propietario.");

        _grantRole(rol, account);
    }
}