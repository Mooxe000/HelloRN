{
  cfx
  cfxify
} = require '../../../common/cfx'

{ Component } = React = require 'react-native'

{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'
thunk = require 'redux-thunk'
{ Provider } = require '../../../libs/react-redux/index'
Provider = cfx Provider
reducers = require '../reducers/index'
createStoreWithMiddleware = applyMiddleware(thunk.default)(createStore)
reducer = combineReducers reducers
store = createStoreWithMiddleware reducer

CounterApp = cfx require './CounterApp'

module.exports = ->

  Provider store: store
  ,
    CounterApp()
