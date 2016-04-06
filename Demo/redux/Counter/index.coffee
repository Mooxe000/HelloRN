#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
co = require 'co'

createSagaMiddleware = (
  require 'redux-saga'
).default

logger = require 'redux-logger'

onStateChange = (
  require 'redux-on-state-change'
).default
isEqual = require 'is-equal'

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

tasks = [
  -> incrementAsync()
  -> incrementAsync 5
  -> decrementAsync 2
  -> decrementAsync 3
  -> incrementAsync 4
]

subscriber = (prevState, nextState, action, dispatch) ->
  unless isEqual prevState, nextState
    dd nextState
    dispatch tasks.shift()()

store = createStore reducers
, [
  createSagaMiddleware.apply @
  , sagas.counterApp
  onStateChange subscriber
  # logger()
]

gen = -> store.dispatch tasks.shift()()

co gen()
