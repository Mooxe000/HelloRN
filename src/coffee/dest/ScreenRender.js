var Comps, RN, Styl, Text, ref, styles;

ref = require('./common/cfx'), Comps = ref.Comps, Styl = ref.Styl;

Text = Comps.Text;

RN = require('react-native');

styles = Styl({
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
