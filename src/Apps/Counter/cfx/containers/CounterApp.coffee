{ assign } = Object
{
  cfxify
  cfx
} = require '../../../../common/cfx'
{
  connect
} = require '../../../../common/reactReduxHelper'

Counter = require '../components/Counter'
counterActions = require '../actions/CounterActions'

CounterApp = cfx ->
  {
    state
    actions
  } = @props

  Counter(
    assign {}, actions
    , counter: state.count
  )

module.exports = connect 'counter'
  , counterActions
  , CounterApp
