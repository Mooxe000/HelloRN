var Platform, RN, StyleSheet, Text, funcs, layout, ref, styles;

ref = RN = require('react-native'), Platform = ref.Platform, StyleSheet = ref.StyleSheet;

Text = require('../common/cfx-components').Text;

styles = StyleSheet.create(require('./style'));

layout = require('./layout');

funcs = {
  notice: function() {
    if (Platform.OS === 'ios') {
      return Text({
        style: styles.instructions
      }, "Press Cmd+R to reload,\nCmd+D or shake for dev menu");
    } else {
      return Text({
        style: styles.instructions
      }, 'Shake or press menu button for dev menu');
    }
  }
};

module.exports = function() {
  return layout(styles, funcs);
};
