var admin = artifacts.require("admin");
var day = 12;
var month = 1;
var year = 2020;
var name = "MediBlock";
module.exports = deployer => {
    deployer.deploy(admin, day, month, year, name);
};
