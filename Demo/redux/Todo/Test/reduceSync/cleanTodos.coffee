Types = (
  require '../../Client/constants/index'
).Todo.types
{ SHOW_COMPLETED_TODO } = Types

actions =
  todoApp: require '../../Client/actions/index'
{ loadTodoState } = actions.todoApp.Todo

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'clean todos'

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO
    todos: []

  actual: (store, task, tasks) ->

    store.dispatch loadTodoState
      todos: []

  test: (store, task, tasks) ->

    state = store.getState()
    { todos } = state.todoApp

    dd forPrintSiState state.todoApp

    @deepEqual state.todoApp
    , task.expected, task.msg

    tasks.shift()
