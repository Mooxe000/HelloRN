{ assign } = Object
{
  cfxify
  cfx
  connect
} = require '../../../common/cfx'

Counter = require '../components/Counter'
counterActions = require '../actions/CounterActions'

CounterApp = cfxify ->
  {
    state
    actions
  } = @props

  Counter(
    assign actions
    , counter: state.count
  )

module.exports = cfx connect 'counter'
  , counterActions
  , CounterApp
