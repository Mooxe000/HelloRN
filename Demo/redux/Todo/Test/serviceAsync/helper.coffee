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

getTodos = -> services.todoApp.Todo.fetch()

module.exports = {
  getTodos
}
