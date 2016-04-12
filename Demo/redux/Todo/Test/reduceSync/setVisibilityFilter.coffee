Types = (
  require '../../Client/constants/index'
).Todo.types
{ SHOW_COMPLETED_TODO } = Types

actions =
  todoApp: require '../../Client/actions/index'
{ setVisibilityFilter } = actions.todoApp.Todo

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'setVisibilityFilter todo'

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO


  actual: (store, task, tasks) ->

    store.dispatch setVisibilityFilter
      filter: SHOW_COMPLETED_TODO

  test: (store, task, tasks) ->

    state = store.getState()
    { visibilityFilter } = state.todoApp

    dd forPrintSiState state.todoApp

    @equal visibilityFilter
    , task.expected.visibilityFilter
    , task.msg

    tasks.shift()
