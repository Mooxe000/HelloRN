actions =
  todoApp: require '../../Client/actions/index'
{ modifyTodoState } = actions.todoApp.Todo

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'completed todo'

  actual: (dispatch) ->

    dispatch modifyTodoState
      index: 1
      todo:
        completed: true

  expected:

    text: 'Learn about reducers'
    completed: true

  test: (state, expected, msg, tasks) ->

    todoIndex = null

    for index, todo of state.todoApp.todos

      todoIndex = index if todo.text is expected.text

    dd forPrintSiState state.todoApp

    @equal state.todoApp.todos[todoIndex].completed
    , expected.completed
    , msg

    tasks.shift()
