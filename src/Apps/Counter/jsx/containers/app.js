import React, { Component } from 'react-native';
import { createStore, applyMiddleware, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import thunk from 'redux-thunk';
import createLogger from 'redux-logger';
const logger = createLogger();

import * as reducers from '../reducers';
import CounterApp from './counterApp';

// const createStoreWithMiddleware = applyMiddleware(thunk, logger)(createStore);
// const reducer = combineReducers(reducers);
// const store = createStoreWithMiddleware(reducer);

const store = createStore(
  combineReducers(reducers),
  // reducers,
  applyMiddleware(thunk, logger)
)

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <CounterApp />
      </Provider>
    );
  }
}
