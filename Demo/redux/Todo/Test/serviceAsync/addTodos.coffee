echo = console.log
dd = require 'ddeyes'

{ initial } = (
  require '../../Client/initials/index'
).Todo()

services =
  todoApp: require '../../Client/services/index'

module.exports = ->

  for text in [
    'Learn about actions'
    'Learn about reducers'
    'Learn about store'
    'Learn about sagas'
  ]
    yield services.todoApp.Todo.create initial.todo text
