{ assign } = Object
{ takeEvery } = require 'redux-saga'
{
  call
  put
} = require 'redux-saga/effects'
crud = require '../crud/index'
types = require '../constants/index'
{
  FETCH_TODO
  CREATE_TODO
  UPDATE_TODO
  DELETE_TODO
} = types.Fetch

Async =

  fetch: (action) ->
    todos = yield call crud.fetch()
    yield put assign {}
    , action
    , type: 'ADD_TODO'
    return

  create: (action) ->
    yield call crud.create action
    return

  update: (action) ->
    yield call crud.update action
    return

  delete: (action) ->
    yield call crud.delete action
    return

rootSaga = [
  ->
    yield from takeEvery FETCH_TODO
    , Async.fetch
  ->
    yield from takeEvery CREATE_TODO
    , Async.create
  ->
    yield from takeEvery UPDATE_TODO
    , Async.update
  ->
    yield from takeEvery DELETE_TODO
    , Async.delete
]

module.exports = rootSaga
