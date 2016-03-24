import React, {
  AppRegistry,
  StyleSheet,
  Platform,
} from 'react-native';

import Router from 'react-native-simple-router';
import Page from './Page';

const styles = StyleSheet.create({
  header: {
    backgroundColor: '#3b5999',
  },
});

const firstRoute = {
  name: 'Explorer',
  component: Page,
};

export default class Explorer extends React.Component {
  render() {
    switch(Platform.OS) {
    case 'android':
      return (
        <Router
          firstRoute={firstRoute}
          handleBackAndroid
          headerStyle={styles.header}
          ref={'router'}
        />
      );
    case 'ios':
      return (
        <Router
          firstRoute={firstRoute}
          headerStyle={styles.header}
          ref={'router'}
        />
      );
    }
  }
}
