var BRM = artifacts.require("./BRM.sol");
var ReliableTokens = artifacts.require("./ReliableTokens.sol")

module.exports = function(deployer) {
  deployer.deploy(BRM);
  deployer.deploy(ReliableTokens);
};
