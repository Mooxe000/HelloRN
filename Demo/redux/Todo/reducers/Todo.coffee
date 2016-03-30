types = require '../constants/index'
dd = require 'ddeyes'
___ = require '../../../../src/common/assign'

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

visibilityFilter = (
  state = Visbility.SHOW_ALL
  action
) ->
  {
    payload
  } = action
  switch action.type

    when SET_VISIBILITY_FILTER
      return payload.filter

    else return state

todos = (
  state = []
  action
) ->
  {
    payload
  } = action
  switch action.type

    when ADD_TODO
      return ___ state
      ,
        text: payload.text
        completed: false

    when COMPLETE_TODO
      return ___ [
        state.slice 0, payload.index
        ___ state[payload.index]
        , completed: true
        state.slice payload.index + 1
      ]

    else return state

todoApp = (
  state = initialState
  action
) ->
  visibilityFilter: visibilityFilter state.visibilityFilter, action
  todos: todos state.todos, action

module.exports = todoApp
