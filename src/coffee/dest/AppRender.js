var Comps, Keyboard, Platform, Screen, Styl, Text, View, cfx, ref, styles;

Platform = require('react-native').Platform;

ref = require('./common/cfx'), cfx = ref.cfx, Comps = ref.Comps, Styl = ref.Styl;

View = Comps.View, Text = Comps.Text;

Screen = cfx(require('./Screen'));

Keyboard = cfx(require('./Keyboard'));

styles = Styl({
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
  }, 'Formulae'), View({
    style: styles.keyboard
  }, Keyboard()));
};
