{ assign } = Object
{ cfxify } = require '../../../common/cfx'
{ Component } = React = require 'react-native'

{ bindActionCreators } = require 'redux'

Counter = require '../components/Counter'
counterActions = require '../actions/CounterActions'
{ connect } = require '../../../libs/react-redux/index'

CounterApp = cfxify ->
  {
    state
    actions
  } = @props

  Counter(
    assign actions
    , counter: state.count
  )

module.exports = connect(
  (state) ->
    state: state.counter
  (dispatch) ->
    actions:
      bindActionCreators counterActions, dispatch
) CounterApp
