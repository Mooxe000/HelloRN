echo = console.log
dd = require 'ddeyes'

services =
  todoApp: require '../../Client/services/index'

{ normalizerTodos } = require '../helper/index'

{ getTodos } = require './helper'

module.exports = ->
  todos = yield getTodos()

  unless todos.length is 0

    normalizer = normalizerTodos todos
    ids = normalizer.result
    for id in ids
      services.todoApp.Todo.delete id

  else return
