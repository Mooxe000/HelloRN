'use strict';

import React, {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';

function notice() {
  if (Platform.OS === 'ios')
    return (
      <Text style={styles.instructions}>
        Press Cmd+R to reload,{'\n'}
        Cmd+D or shake for dev menu
      </Text>
    );
  else
    return(
      <Text style={styles.instructions}>
        Shake or press menu button for dev menu
      </Text>
    );
}

export default function () {
  return (
    <View style={styles.container}>

      <Text style={styles.welcome}>
        Welcome to React Native!
      </Text>

      <Text style={styles.instructions}>
        To get started, edit index.ios.js
      </Text>

      {notice()}

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
