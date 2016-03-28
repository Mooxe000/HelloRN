{ assign } = Object
{
  cfxify
  cfx
  connect
} = require '../../../common/cfx'

Counter = require '../components/Counter'
counterActions = require '../actions/CounterActions'

CounterApp = cfx ->
  {
    state
    actions
  } = @props

  Counter(
    assign actions
    , counter: state.count
  )

module.exports = cfxify connect 'counter'
  , counterActions
  , CounterApp
