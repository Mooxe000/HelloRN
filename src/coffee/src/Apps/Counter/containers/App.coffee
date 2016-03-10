{ Component } = require 'react-native'
{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'
{
  Provider
} = cfx require 'react-redux'
{
  thunk
} = require 'redux-thunk'
{ cfx } = require '../../../common/cfx'

reducers = require '../reducers'
CounterApp = require './CounterApp'

createStoreWithMiddleware = (
  applyMiddleware thunk
) createStore
reducer = combineReducers reducers
store = createStoreWithMiddleware reducer

class App extends Component
  render: ->
    Provider store: store
    ,
      CounterApp()

module.exports = App
