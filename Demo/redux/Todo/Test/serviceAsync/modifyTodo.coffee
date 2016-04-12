echo = console.log
dd = require 'ddeyes'
{ assign } = Object

services =
  todoApp: require '../../Client/services/index'

{ getTodos } = require './helper'

module.exports = ->

  todos = yield getTodos()

  expected = [
      index: 1
      todo:
        completed: true
    ,
      index: 2
      todo:
        text: 'Learn about redux'
  ]

  for waitConf in expected

    newTodo = assign {}
    , todos[waitConf.index], waitConf.todo

    # dd { newTodo }

    services.todoApp.Todo.update newTodo
