Types = (
  require '../../Client/constants/index'
).Todo.types
{ SHOW_ALL_TODO } = Types

actions =
  todoApp: require '../../Client/actions/index'
{ addTodoState } = actions.todoApp.Todo

{ initial } = (
  require '../../Client/initials/index'
).Todo()

{ forPrintSiState } = require '../helper/index'

SI = require '../../../../../src/common/immutableHelper'

module.exports =

  msg: 'add todos'

  expected:
    visibilityFilter: SHOW_ALL_TODO
    todos: [
        text: 'Learn about actions'
        completed: false
      ,
        text: 'Learn about reducers'
        completed: false
      ,
        text: 'Learn about store'
        completed: false
      ,
        text: 'Learn about sagas'
        completed: false
    ]

  actual: (store, task, tasks) ->

    for waitTodo in task.expected.todos

      store.dispatch addTodoState
        todo: initial.todo waitTodo.text

  test: (store, task, tasks) ->

    state = store.getState()

    { todos } = state.todoApp

    return unless todos.length is 4

    expected = SI.Array.eachAsMutable todos
    , (siTodo) ->
      siTodo.without 'id'

    dd forPrintSiState state.todoApp

    @deepEqual task.expected.todos
    , expected, task.msg

    tasks.shift()
