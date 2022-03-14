//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;


contract Whitelist {

    // Size of whitelist (max no. of addresses)
    uint8 public maxWhitelistedAddresses;

    // Map address to bool (so can set to true for whitelisted, false by default)
    mapping(address => bool) public whitelistedAddresses;

    // No. of addresses whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting size of whitelist (user determined value at deployment)
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    // Add address of sender to whitelist
    function addAddressToWhitelist() public {
        // Check if user already whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // Check if numAddressesWhitelisted < maxWhitelistedAddresses
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // Add address which called function to whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}