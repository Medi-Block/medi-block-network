var PatientFactory = artifacts.require("PatientFactory");
module.exports = deployer => {
    console.log(deployer.deploy(PatientFactory));
};
