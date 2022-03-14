const { ethers } = require("hardhat");

async function main() {

  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // Deploy the contract
  const deployedWhitelistContract = await whitelistContract.deploy(100);
  // 100 whitelisted addresses allowed
  
  // Wait for deployment
  await deployedWhitelistContract.deployed();

  // Print address of deployed contract
  console.log(
    "Whitelist Contract Address:",
    deployedWhitelistContract.address
  );
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });