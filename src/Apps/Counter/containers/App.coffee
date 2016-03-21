{
  cfx
  cfxify
  # Comp
} = require '../../../common/cfx'
{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'
thunk = require 'redux-thunk'
{ Provider } = cfx require '../../../libs/react-redux/index'

reducers = require '../reducers/index'
CounterApp = require './CounterApp'

createStoreWithMiddleware = (
  applyMiddleware thunk
) createStore
reducer = combineReducers reducers
store = createStoreWithMiddleware reducer

module.exports = cfxify ->

  Provider store: store
  ,
    CounterApp()
