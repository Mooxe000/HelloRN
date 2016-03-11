{ Component } = require 'react-native'
{ assign } = Object

{ bindActionCreators } = require 'redux'
Counter = require '../components/Counter'
counterActions = require '../actions/CounterActions'
{ connect } = require 'react-redux'

class CounterApp extends Component

  counstructor: (props) ->
    super props

  render: ->
    {
      state
      actions
    } = @props

    return (
      Counter do ->
        assign counter: state.count
        , actions
    )

module.exports = connect(
    (state) -> state.counter
  , (dispatch) ->
    actions:
      bindActionCreators counterActions, dispatch
  ) CounterApp
