Types = (
  require '../../Client/constants/index'
).Todo.types
{ SHOW_COMPLETED_TODO } = Types

actions =
  todoApp: require '../../Client/actions/index'
{ setVisibilityFilter } = actions.todoApp.Todo

module.exports =

  msg: 'setVisibilityFilter todo'

  actual: (dispatch) ->

    dispatch setVisibilityFilter
      filter: SHOW_COMPLETED_TODO

  expected:

    visibilityFilter: SHOW_COMPLETED_TODO

  test: (state, expected, msg, tasks) ->

    newState =
      visibilityFilter: state.todoApp.visibilityFilter
      todos: []

    for todo in state.todoApp.todos
      newState.todos.push
        id: todo.id
        text: todo.text
        completed: todo.completed

    dd newState

    @equal state.todoApp.visibilityFilter
    , expected.visibilityFilter
    , msg

    tasks.shift()
