#!/usr/bin/env coffee
echo = -> console.log arguments
dd = require 'ddeyes'

createStore = require '../helper'

reducers =
  todoApp: require './reducers/Todo'
actions =
  todoApp: require './actions/Todo'

###
    Flow
###
{
  addTodo
  removeTodo
  completeTodo
  setVisibilityFilter
} = actions.todoApp

#   init
store = createStore reducers
dd store.getState()

#   addTodo
for text in [
  'Learn about actions'
  'Learn about reducers'
  'Learn about store'
]
  store.dispatch actions.todoApp.addTodo
    text: text
dd store.getState()

#   completeTodo
store.dispatch completeTodo
  index: 0
dd store.getState()
