#!/usr/bin/env coffee
echo = -> console.log arguments
dd = require 'ddeyes'

createSagaMiddleware = (
  require 'redux-saga'
).default
logger = require 'redux-logger'
{
  createStore
} = require '../../../src/common/reduxHelper'

reducers =
  counterApp: require './reducers/index'

sagas =
  counterApp: require './sagas/index'

{
  increment
  incrementAsync
  decrement
  decrementAsync
} = require './actions/index'

{
  INCREMENT
  DECREMENT
} = require './constants/index'

store = createStore reducers
, [
  createSagaMiddleware.apply @
  , sagas.counterApp
  # logger()
]

gen = ->
  # unsubscribe = yield store.subscribe ->
  #   store.getState()
  yield store.dispatch incrementAsync()
  dd store.getState()
  yield store.dispatch incrementAsync 4
  dd store.getState()
  yield store.dispatch decrementAsync 1
  dd store.getState()
  yield store.dispatch decrementAsync()
  dd store.getState()
  yield store.dispatch decrementAsync 2
  dd store.getState()
  # unsubscribe()

scheduler = (task) ->
  setTimeout ->
    taskObj = task.next task.value
    # 如果Generator函数未结束，就继续调用
    unless taskObj.done
      task.value = taskObj.value
      scheduler task
  , 0

scheduler gen()
