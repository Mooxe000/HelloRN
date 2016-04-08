echo = console.log
dd = require 'ddeyes'
{ assign } = Object
{
  handleAction
  handleActions
} = require 'redux-actions'
si = require '../../../../../src/common/immutableHelper'
{
  mergeReduce
} = require '../../../../../src/common/reduxHelper'

constants = require '../constants/index'
{
  LOAD_TODO_STATE
  ADD_TODO_STATE
  MODIFY_TODO_STATE
  REMOVE_TODO_STATE
  SET_VISIBILITY_FILTER
} = constants.Todo.State.types

{
  initial
  initialState
} = (
  require '../initials/index'
).Todo()

visibilityFilter = handleAction(
  SET_VISIBILITY_FILTER
  next: (state, action) ->
    { filter } = action.payload
    filter
  throw: (state, action) ->
    throw new Error {
      state
      action
    }
)

todos = handleActions

  LOAD_TODO_STATE: (state, action) ->
    action.payload

  ADD_TODO_STATE: (state, action) ->
    {
      text
    } = action.payload

    si.Array.push state
    , [
      initial.todo text
    ]

  MODIFY_TODO_STATE: (state, action) ->
    {
      index
      todo
    } = action.payload

    si.Array.set state, index
    ,
      assign {}, state[index], todo

  REMOVE_TODO_STATE: (state, action) ->
    {
      index
    } = action.payload

    si.Array.remove state
    , index

# , []

todoApp = mergeReduce {
  visibilityFilter
  todos
}
, initialState

module.exports = todoApp
