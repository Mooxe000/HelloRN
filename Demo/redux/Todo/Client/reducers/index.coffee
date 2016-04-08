echo = console.log
dd = require 'ddeyes'
{
  handleAction
  handleActions
} = require 'redux-actions'
# reduceReducers = require 'reduce-reducers'
types = require '../constants/index'
si = require '../../../../../src/common/immutableHelper'
{
  mergeReduce
} = require '../../../../../src/common/reduxHelper'

{
  Visibility
  Todo
} = types
{
  SET_VISIBILITY_FILTER
  ADD_TODO
  REMOVE_TODO
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
    si.Array.push state
    , [
      text: action.payload.text
      completed: false
    ]

  REMOVE_TODO: (state, action) ->
    si.Array.remove state
    , action.payload.index

  COMPLETE_TODO: (state, action) ->
    si.Array.set state
    , action.payload.index
    , state[action.payload.index].merge
      completed: true

# , []

todoApp = mergeReduce {
  visibilityFilter
  todos
}
, initialState

module.exports = todoApp
