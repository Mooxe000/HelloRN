{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

SI = require '../../../../../src/common/immutableHelper'

normalizerTodos = (todos) ->

  normalizer = normalize todos
  , arrayOf new Schema 'todos'

forPrintSiState = (state) ->

  visibilityFilter: state.visibilityFilter
  todos: SI.Array.eachAsMutable state.todos

module.exports = {
  normalizerTodos
  forPrintSiState
}
