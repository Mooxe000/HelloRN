{ createAction } = require 'redux-actions'
types = require '../constants/index'

addTodo =
  createAction types.Todo.ADD_TODO

removeTodo =
  createAction types.Todo.REMOVE_TODO

completeTodo =
  createAction types.Todo.COMPLETE_TODO

setVisibilityFilter =
  createAction types.Todo.SET_VISIBILITY_FILTER

module.exports = {
  addTodo
  removeTodo
  completeTodo
  setVisibilityFilter
}
