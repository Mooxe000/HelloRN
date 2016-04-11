echo = console.log
dd = require 'ddeyes'
{ assign } = Object
{
  handleAction
  handleActions
} = require 'redux-actions'
SI = require '../../../../../src/common/immutableHelper'
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
} = constants.Todo.types

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
    action.payload.todos

  ADD_TODO_STATE: (state, action) ->
    { todo } = action.payload

    SI.Array.push state
    , [ todo ]

  MODIFY_TODO_STATE: (state, action) ->
    {
      index
      todo
    } = action.payload

    SI.Array.set state, index
    ,
      assign {}, state[index], todo

  REMOVE_TODO_STATE: (state, action) ->
    {
      todoId
    } = action.payload

    SI.Array.remove state
    , id: todoId

# , []

todoApp = mergeReduce {
  visibilityFilter
  todos
}
, initialState

module.exports = todoApp
