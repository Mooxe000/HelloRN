'use strict';

import React, { Component } from 'react-native';
import {bindActionCreators} from 'redux';
import Counter from '../../Counter/components/Counter';
// import * as counterActions from '../actions/counterActions';
import * as counterActions from '../../Counter/actions/CounterActions';
import { connect } from '../../../libs/react-redux/index.js';

// @connect(state => ({
//   state: state.counter
// }))
class CounterApp extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { state, actions } = this.props;
    return (
      <Counter
        counter={state.count}
        {...actions} />
    );
  }
}

export default connect(state => ({
    state: state.counter
  }),
  (dispatch) => ({
    actions: bindActionCreators(counterActions, dispatch)
  })
)(CounterApp);
