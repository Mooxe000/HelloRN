{
  bindActionCreators
} = require 'redux'

ReactRedux = require '../libs/react-redux/index'

connect = (stateName, actions, Component) ->
  ReactRedux.connect(
    (state) ->
      state: state[stateName]
    (dispatch) ->
      actions:
        bindActionCreators actions, dispatch
  ) Component

exports.Provider = cfxify ReactRedux.Provider
exports.connect = connect
