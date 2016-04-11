#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
test = require 'tape'

{ createStore } = require '../../../../../src/common/reduxHelper'

reducers =
  todoApp: require '../../Client/reducers/index'

store = createStore reducers

tasks = [
  require './addTodos'
  require './completedTodo'
  require './modifyTodoText'
  require './setVisibilityFilter'
  require './cleanTodos'
]

test 'Redux Test'
, (t) ->

  unsubscribe = store.subscribe ->
    state = store.getState()
    unless tasks.length is 0
      task = tasks[0]
      task.test.apply t
      , [
        state
        task.expected
        task.msg
        tasks
      ]

  for task in tasks.slice()
    task.actual store.dispatch

  unsubscribe()

  t.end()
