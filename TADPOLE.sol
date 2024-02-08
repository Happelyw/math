//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

/* 
Website https://www.froggyfriends.io/
Swap  https://swap.froggyfriendsnft.com/
Opensea https://opensea.io/collection/froggyfriendsnft
Ribbit Items https://opensea.io/collection/ribbit-items
Soulbound https://opensea.io/collection/froggy-soulbounds
Twitter https://twitter.com/FroggyFriendNFT
Discord https://discord.com/invite/BfPr9njdut
*/

import {ERC404} from "./ERC404.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract FroggyFriends is ERC404 {
    string public dataURI;
    string public baseTokenURI;

    constructor(address _owner) ERC404("Froggy Friends 404", "TADPOLE", 18, 10000, _owner) {
        balanceOf[_owner] = totalSupply;
        setWhitelist(_owner, true);

        // univ2 router
        setWhitelist(address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D), true);
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function setNameSymbol(string memory _name, string memory _symbol) public onlyOwner {
        _setNameSymbol(_name, _symbol);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        return string.concat(baseTokenURI, Strings.toString(id)); 
    }
}