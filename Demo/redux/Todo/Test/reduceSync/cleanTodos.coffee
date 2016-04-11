Types = (
  require '../../Client/constants/index'
).Todo.types
{ SHOW_COMPLETED_TODO } = Types

actions =
  todoApp: require '../../Client/actions/index'
{ loadTodoState } = actions.todoApp.Todo

module.exports =

  msg: 'clean todos'

  actual: (dispatch) ->

    dispatch loadTodoState
      todos: []

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO
    todos: []

  test: (state, expected, msg, tasks) ->

    dd state.todoApp

    @deepEqual state.todoApp
    , expected, msg

    tasks.shift()
