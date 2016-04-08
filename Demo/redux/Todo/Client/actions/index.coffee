{
  createActions
} = require '../../../../../src/common/reduxHelper'
types = require '../constants/index'
{
  ADD_TODO
  REMOVE_TODO
  COMPLETE_TODO
  SET_VISIBILITY_FILTER
} = types.Todo

actions =
  addTodo: ADD_TODO
  removeTodo: REMOVE_TODO
  completeTodo: COMPLETE_TODO
  setVisibilityFilter: SET_VISIBILITY_FILTER

module.exports = createActions actions
