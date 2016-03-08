var Platform, RN, StyleSheet, Text, View, notice, ref, styles;

ref = RN = require('react-native'), Platform = ref.Platform, StyleSheet = ref.StyleSheet, Text = ref.Text, View = ref.View;

styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5
  }
});

notice = function() {
  if (Platform.OS === 'ios') {
    return RN.createElement(Text, {
      style: styles.instructions
    }, "Press Cmd+R to reload,\nCmd+D or shake for dev menu");
  } else {
    return RN.createElement(Text, {
      style: styles.instructions
    }, 'Shake or press menu button for dev menu');
  }
};

module.exports = function() {
  return RN.createElement(View, {
    style: styles.container
  }, RN.createElement(Text, {
    style: styles.welcome
  }, 'Welcome to React Native!'), RN.createElement(Text, {
    style: styles.instructions
  }, 'To get started, edit index.ios.js'), notice());
};
