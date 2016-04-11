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

module.exports =

  msg: 'add todos'

  actual: (dispatch) ->

    for text in [
      'Learn about actions'
      'Learn about reducers'
      'Learn about store'
      'Learn about sagas'
    ]

      dispatch addTodoState
        todo: initial.todo text

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

  test: (state, expected, msg, tasks) ->

    return unless state.todoApp.todos.length is 4

    _expected = []

    for todo in state.todoApp.todos

      _expected.push
        text: todo.text
        completed: todo.completed

    dd forPrintSiState state.todoApp

    @deepEqual expected.todos
    , _expected, msg

    tasks.shift()
