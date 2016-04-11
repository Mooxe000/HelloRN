#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
isEqual = require 'is-equal'
co = require 'co'

onStateChange = (
  require 'redux-on-state-change'
).default

{
  createStore
  createSagaMiddleware
} = require '../../../../../src/common/reduxHelper'

reducers =
  todoApp: require '../../Client/reducers/index'
sagas =
  todoApp: require '../../Client/sagas/index'

{ Types } = (
  require '../../Client/constants/index'
).Todo

EE = require './EventEmitter'

tasks = [
  require './cleanTodos'
  require './addTodos'
  require './modifyTodo'
]

subscriber = (
  prevState
  nextState
  action
  dispatch
) ->
  unless action.type is 'LOAD_TODO_STATE'
    return if isEqual prevState, nextState
  unless tasks.length is 0
    tasks[0] dispatch
    , action
    , tasks
    , store

store = createStore reducers
, [
  createSagaMiddleware sagas.todoApp
  onStateChange subscriber
]

tasks[0] store.dispatch
, undefined
, tasks, store
