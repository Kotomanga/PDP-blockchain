// var ConvertLib = artifacts.require("./ConvertLib.sol");
// var MetaCoin = artifacts.require("./MetaCoin.sol");
// var ProductHistory = artifacts.require("./ProductHistory.sol")
var Owner = artifacts.require("./Owner.sol");
var Product = artifacts.require("./Product.sol")
var Marketplace = artifacts.require("./Marketplace.sol");


module.exports = function(deployer) {
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.deploy(MetaCoin);
  deployer.deploy(Owner);
  deployer.deploy(Product);
  deployer.link(Owner, Product, Marketplace);
  deployer.deploy(Marketplace);

   // deployer.deploy(ProductHistory);
};
