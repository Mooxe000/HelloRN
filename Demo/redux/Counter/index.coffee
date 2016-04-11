#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'

test = require 'tape'
isEqual = require 'is-equal'

co = require 'co'

onStateChange = (
  require 'redux-on-state-change'
).default

{
  createStore
  createSagaMiddleware
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

tasksBase = [
    actual:
      sync: -> increment()
      async: -> incrementAsync()
    expected: counterApp: count: 1
    msg: '0 + 1 = 1'
  ,
    actual:
      sync: -> increment 5
      async: -> incrementAsync 5
    expected: counterApp: count: 6
    msg: '1 + 5 = 6'
  ,
    actual:
      sync: -> decrement 2
      async: -> decrementAsync 2
    expected: counterApp: count: 4
    msg: '6 - 2 = 4'
  ,
    actual:
      sync: -> decrement 3
      async: -> decrementAsync 3
    expected: counterApp: count: 1
    msg: '4 - 3 = 1'
  ,
    actual:
      sync: -> increment 4
      async: -> incrementAsync 4
    expected: counterApp: count: 5
    msg: '1 + 4 = 5'
]

test 'Sync Saga Test'
, (t) ->

  tasks = tasksBase.slice()

  store = createStore reducers
  , [
    createSagaMiddleware sagas.counterApp
  ]

  unsubscribe = store.subscribe ->
    state = store.getState()
    task = tasks.shift()
    dd state
    t.deepEqual state
    , task.expected
    , task.msg

  for task in tasks.slice()
    store.dispatch task.actual.sync()

  unsubscribe()

  t.end()

test 'Async Saga Test'
, (t) ->

  tasks = tasksBase.slice()

  subscriber = (prevState, nextState, action, dispatch) ->
    return if isEqual prevState, nextState
    dd nextState
    task = tasks.shift()
    t.deepEqual nextState
    , task.expected
    , task.msg
    dispatch tasks[0].actual.async()

  store = createStore reducers
  , [
    createSagaMiddleware sagas.counterApp
    onStateChange subscriber
  ]

  co do ->
    store.dispatch tasks[0].actual.async()

  t.end()
