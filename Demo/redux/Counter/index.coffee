#!/usr/bin/env coffee
echo = -> console.log arguments
dd = require 'ddeyes'

thunk = require 'redux-thunk'
logger = require 'redux-logger'
{
  createStore
} = require '../../../src/common/reduxHelper'

reducers =
  counterApp: require './reducers/index'
{
  increment
  decrement
} = require './actions/index'

{
  INCREMENT
  DECREMENT
} = require './constants/index'

store = createStore reducers

unsubscribe = store.subscribe ->
  dd store.getState()

store.dispatch increment()
store.dispatch increment 3
store.dispatch decrement 1
store.dispatch decrement 4

unsubscribe()
