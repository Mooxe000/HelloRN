var App, AppRegistry, RN;

AppRegistry = (
  RN = require('react-native')
).AppRegistry;

App = require('./App.js');

AppRegistry.registerComponent('HelloRN'
, function() {
  return App;
});
