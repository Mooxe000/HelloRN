actions =
  todoApp: require '../../Client/actions/index'
{ modifyTodoState } = actions.todoApp.Todo

module.exports =

  msg: 'modify todo text'

  actual: (dispatch) ->

    dispatch modifyTodoState
      index: 2
      todo:
        text: 'Learn about redux'

  expected:

    text: 'Learn about redux'
    completed: false

  test: (state, expected, msg, tasks) ->

    newState =
      visibilityFilter: state.todoApp.visibilityFilter
      todos: []

    todoIndex = null

    for index, todo of state.todoApp.todos

      newState.todos.push
        id: todo.id
        text: todo.text
        completed: todo.completed

      todoIndex = index if todo.text is expected.text

    dd newState

    @equal state.todoApp.todos[todoIndex].completed
    , expected.completed
    , msg

    tasks.shift()
