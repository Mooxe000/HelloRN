thunk = require 'redux-thunk'
logger = require 'redux-logger'

{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'

createStoreWithMiddleware = (
  applyMiddleware thunk.default
  # , logger()
) createStore

createStore = (reducers) ->
  reducer = combineReducers reducers
  createStoreWithMiddleware reducer

module.exports = createStore
