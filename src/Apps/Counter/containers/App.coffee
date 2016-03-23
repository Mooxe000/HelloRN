{
  createStore
  Provider
} = require '../../../common/cfx'

reducers = require '../reducers/index'
store = createStore reducers

CounterApp = require './CounterApp'

module.exports = ->

  Provider store: store
  ,
    CounterApp()
