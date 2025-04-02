// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/token/ERC20/ERC20Upgradeable.sol";
import {ERC20PermitUpgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import {ERC20VotesUpgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable@5.2.0/proxy/utils/Initializable.sol";
import {NoncesUpgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/utils/NoncesUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/access/OwnableUpgradeable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable@5.2.0/proxy/utils/UUPSUpgradeable.sol";

/// @custom:security-contact rucryptowhale@gmail.com
contract NextProVista is Initializable, ERC20Upgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address recipient, address initialOwner)
        public initializer
    {
        __ERC20_init("Next Pro Vista", "NPV");
        __ERC20Permit_init("Next Pro Vista");
        __ERC20Votes_init();
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();

        _mint(recipient, 381654729 * 10 ** decimals());
    }

    function clock() public view override returns (uint48) {
        return uint48(block.timestamp);
    }

    // solhint-disable-next-line func-name-mixedcase
    function CLOCK_MODE() public pure override returns (string memory) {
        return "mode=timestamp";
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20Upgradeable, ERC20VotesUpgradeable)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20PermitUpgradeable, NoncesUpgradeable)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}
