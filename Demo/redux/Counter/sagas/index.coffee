echo = console.log
{ takeEvery } = require 'redux-saga'
{
  put
  call
} = require 'redux-saga/effects'

delay = (ms) ->
  new Promise (resolve) ->
    setTimeout resolve, ms

incrementAsync = (action) ->
  {
    payload
  } = action
  # yield call delay, 1000
  yield put {
    type: 'INCREMENT'
    payload
  }
  return

decrementAsync = (action) ->
  {
    payload
  } = action
  # yield call delay, 1000
  yield put {
    type: 'DECREMENT'
    payload
  }
  return

rootSaga = [
  ->
    yield from takeEvery 'INCREMENT_ASYNC'
    , incrementAsync

  ->
    yield from takeEvery 'DECREMENT_ASYNC'
    , decrementAsync
]

module.exports = rootSaga
