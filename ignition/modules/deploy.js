const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("MetaCircleModule", (m) => {
  const MetacircleContract = m.contract("MetaCircle", []);
  return { MetacircleContract };
});
