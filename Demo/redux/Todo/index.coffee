#!/usr/bin/env coffee
echo = -> console.log arguments
dd = require 'ddeyes'

thunk = require 'redux-thunk'
logger = require 'redux-logger'
{
  createStore
} = require '../../../src/common/reduxHelper'

reducers =
  todoApp: require './reducers/Todo'
actions =
  todoApp: require './actions/Todo'

VisibilityFilters = require './constants/Visibility'

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
# , [
#   thunk.default
#   logger()
# ]

unsubscribe = store.subscribe ->
  dd store.getState()

#   addTodo
for text in [
  'Learn about actions'
  'Learn about reducers'
  'Learn about store'
]
  store.dispatch actions.todoApp.addTodo
    text: text

#   completeTodo
store.dispatch completeTodo
  index: 0

store.dispatch completeTodo
  index: 1

#   removeTodo
store.dispatch removeTodo
  index: 2

#   visibility
store.dispatch setVisibilityFilter
  filter:
    VisibilityFilters
    .SHOW_COMPLETED

unsubscribe()
