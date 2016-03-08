var RN, StyleSheet, Text, styles;

StyleSheet = (RN = require('react-native')).StyleSheet;

Text = require('./common/cfx-components').Text;

styles = StyleSheet.create({
  screen: {
    color: '#190d08',
    fontSize: 70,
    fontWeight: '200'
  }
});

module.exports = function() {
  return Text({
    style: styles.screen
  }, 1000);
};
