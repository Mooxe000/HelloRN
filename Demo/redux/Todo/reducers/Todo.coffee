{
  handleAction
  handleActions
} = require 'redux-actions'
reduceReducers = require 'reduce-reducers'
types = require '../constants/index'
echo = console.log
dd = require 'ddeyes'
___ = require '../../../../src/common/assign'
{
  mergeReduce
} = require '../../../../src/common/reduxHelper'

{
  Visibility
  Todo
} = types
{
  SET_VISIBILITY_FILTER
  ADD_TODO
  COMPLETE_TODO
} = Todo

initialState =
  visibilityFilter: Visibility.SHOW_ALL
  todos: []

visibilityFilter = handleAction SET_VISIBILITY_FILTER
, next: (
  state = Visbility.SHOW_ALL
  action
) -> action.payload.filter
# , throw

todos = handleActions

  ADD_TODO: (state, action) ->
    ___ state
    ,
      text: action.payload.text
      completed: false

  COMPLETE_TODO: (state, action) ->
    ___ [
      state.slice 0, action.payload.index
      ___ state[action.payload.index]
      , completed: true
      state.slice action.payload.index + 1
    ]

, []

todoApp = mergeReduce {
  visibilityFilter
  todos
}
, initialState

module.exports = todoApp
