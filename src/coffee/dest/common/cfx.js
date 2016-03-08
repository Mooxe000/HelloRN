var RN, cfxify;

RN = require('react-native');

cfxify = function(compName) {
  return RN.createFactory(compName);
};

exports.cfxify = cfxify;
