// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract loteria is ERC20, Ownable {

    // Gestion de los tokens

    // Direccion del contrato NFT del proyecto
    address public nft;

    // Constructor
    constructor() ERC20("Loteria", "JC"){
        _mint(address(this), 1000);
        nft = address(new mainERC721());
    }

    // Ganador del premio de la loteria
    address public ganador;

    // Registro del usuario
    mapping(address => address) public usuario_contract;

    // Precio de los tokens
    function precioTokens(uint256 _numTokens) internal pure returns (uint256){
        return _numTokens * (0.01 ether);
    }

    // Visualizacion del balance de tokens ERC-20 de un usuario
    function balanceTokens(address _account) public view returns (uint256){
        return balanceOf(_account);
    }

    // Visualizacion del balance de tokens ERC-20 del Smart Contract
    function balanceTokensSC() public view returns (uint256){
        return balanceOf(address(this));
    }

    // Visualización del balance de ethers del Smart Contract
    function balanceEthersSC() public view returns (uint256){
        return address(this).balance / 10**18;
    }

    // Generación de nuevos tokens Tokens ERC-20
    function mint(uint256 _amount) public onlyOwner {
        _mint(address(this), _amount);
    }

    // Registro de usuarios
    function registrar() internal {
        address addr_personal_contract = address(new boletosNFTs(msg.sender, address(this), nft));
        usuario_contract[msg.sender] = addr_personal_contract;
    }

}

contract mainERC721 is ERC721 {

    constructor() ERC721("Loteria", "STE"){}

}

contract boletosNFTs {
    
    // Constructor del Smart Contract (hijo)
    constructor(address _propietario, address _contratoPadre, address _contratoNFT){
        //address owner = _propietario;
    }
}