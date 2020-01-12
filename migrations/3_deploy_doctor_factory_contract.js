var Doctorfactory = artifacts.require("Doctorfactory");
module.exports = deployer => {
    console.log(deployer.deploy(Doctorfactory));
};
