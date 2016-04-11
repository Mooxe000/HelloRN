{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

normalizerTodos = (todos) ->

  normalizer = normalize todos
  , arrayOf new Schema 'todos'

forPrintSiState = (state) ->

  newState =
    visibilityFilter: state.visibilityFilter
    todos: []

  for todo in state.todos
    newState.todos.push
      id: todo.id
      text: todo.text
      completed: todo.completed

  newState

module.exports = {
  normalizerTodos
  forPrintSiState
}
