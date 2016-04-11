{ assign } = Object
echo = console.log
dd = require 'ddeyes'
services =
  todoApp: require '../../Client/services/index'
{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

todosSchema = new Schema 'todos'

services =
  todoApp: require '../../Client/services/index'

normalizerFetch = ->
  services.todoApp.Todo.fetch()
  # .then (json) -> dd json
  .then (json) ->
    normalizer = normalize json
    , arrayOf todosSchema

toggleState = (index) ->
  normalizerFetch()
  .then (normalizer) ->
    ids = normalizer.result
    id = ids[index]
    todo = normalizer.entities.todos[id]
    do -> assign {}, todo
    , completed: if todo.done then false else true
  .then (newTodo) ->
    services.todoApp.Todo.update newTodo

deleteAll = ->
  normalizerFetch()
  .then (normalizer) ->
    ids = normalizer.result
    for id in ids
      services.todoApp.Todo.delete id

module.exports = {
  normalizerFetch
  deleteAll
  toggleState
}
