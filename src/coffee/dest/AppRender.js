var Platform, RN, Screen, StyleSheet, Text, View, cfxify, ref, ref1, styles;

ref = RN = require('react-native'), StyleSheet = ref.StyleSheet, Platform = ref.Platform;

cfxify = require('./common/cfx').cfxify;

ref1 = require('./common/cfx-components'), View = ref1.View, Text = ref1.Text;

Screen = cfxify(require('./Screen'));

styles = StyleSheet.create({
  container: {
    flex: 1
  },
  screen: {
    flex: 3,
    flexDirection: 'row',
    alignItems: Platform.OS === 'android' ? 'center' : 'flex-end',
    justifyContent: 'flex-end',
    backgroundColor: '#68cef2',
    padding: 18
  },
  formulae: {
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'flex-end',
    backgroundColor: '#4c4c4c',
    padding: 20
  },
  keyboard: {
    height: 420
  }
});

module.exports = function() {
  return View({
    style: styles.container
  }, View({
    style: styles.screen
  }, Screen()), Text({
    style: styles.formulae
  }, 'Formulae'), Text({
    style: styles.keyboard
  }, 'keyboard'));
};
