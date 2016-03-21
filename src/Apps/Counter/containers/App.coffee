{
  cfx
  cfxify
  createStore
  Provider
} = require '../../../common/cfx'

{ Component } = React = require 'react-native'

reducers = require '../reducers/index'
store = createStore reducers

CounterApp = require './CounterApp'

module.exports = ->

  Provider store: store
  ,
    CounterApp()
