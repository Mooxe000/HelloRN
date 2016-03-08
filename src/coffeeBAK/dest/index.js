var App, AppRegistry, RN;

AppRegistry = (RN = require('react-native')).AppRegistry;

App = require('./App');

AppRegistry.registerComponent('HelloRN', function() {
  return App;
});
