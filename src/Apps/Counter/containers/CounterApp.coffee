{ assign } = Object
{ cfxify } = require '../../../common/cfx'

# { bindActionCreators } = require 'redux'
Counter = require '../components/Counter'
# counterActions = require '../actions/CounterActions'
# { connect } = require '../../../libs/react-redux/index'

CounterApp = ->
  {
    state
    actions
  } = @props

  # Counter (
  #   assign counter: state.count
  #   , actions
  # )

  Counter counter: 99

module.exports = cfxify CounterApp

# connect(
#   (state) => state.counter
#   (dispatch) =>
#     actions:
#       bindActionCreators counterActions, dispatch
# )
