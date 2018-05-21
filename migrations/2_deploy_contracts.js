var BRM = artifacts.require("./BRM.sol");
var ReliableTokens = artifacts.require("./ReliableTokens.sol")
var VersionManager = artifacts.require("./VersionManager.sol")

module.exports = function(deployer) {
    deployer.deploy(BRM);
    deployer.deploy(ReliableTokens);
    deployer.deploy(VersionManager);
};
