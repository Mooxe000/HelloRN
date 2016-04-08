echo = console.log
{ assign } = Object
{ takeEvery } = require 'redux-saga'
{
  put
  call
} = require 'redux-saga/effects'
{
  INCREMENT
  INCREMENT_ASYNC
  DECREMENT
  DECREMENT_ASYNC
} = require '../constants/index'

delay = (ms) ->
  new Promise (resolve) ->
    setTimeout resolve, ms

incrementAsync = (action) ->
  yield call delay, 1000
  yield put assign {}
  , action
  , type: INCREMENT
  return

decrementAsync = (action) ->
  yield call delay, 1000
  yield put assign {}
  , action
  , type: DECREMENT
  return

rootSaga = [
  ->
    yield from takeEvery INCREMENT_ASYNC
    , incrementAsync

  ->
    yield from takeEvery DECREMENT_ASYNC
    , decrementAsync
]

module.exports = rootSaga
