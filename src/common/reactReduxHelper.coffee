{ cfxify } = require './cfx'
{ bindActionCreators } = require 'redux'

# ReactRedux = require '../libs/react-redux/index'
ReactRedux = require 'react-redux'

connect = (stateName, actions, Component) ->
  cfxify ReactRedux.connect(
    (state) ->
      state: state[stateName]
    (dispatch) ->
      actions:
        bindActionCreators actions, dispatch
  ) Component

exports.Provider = cfxify ReactRedux.Provider
exports.connect = connect
