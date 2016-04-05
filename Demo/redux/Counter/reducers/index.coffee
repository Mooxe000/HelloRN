echo = console.log
dd = require 'ddeyes'
{
  handleAction
  handleActions
} = require 'redux-actions'

{
  mergeReduce
} = require '../../../../src/common/reduxHelper'

{
  INCREMENT
  DECREMENT
} = require '../constants/index'

initialState =
  count: 0

count = handleActions

  INCREMENT: (state, action) ->
    # dd increment: action
    action.payload or= 1
    state + action.payload

  DECREMENT: (state, action) ->
    # dd decrement: action
    action.payload or= 1
    state - action.payload

# , 0

module.exports = mergeReduce {
  count
}
, initialState
