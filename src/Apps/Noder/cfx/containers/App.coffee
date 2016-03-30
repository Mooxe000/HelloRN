{
  createStore
  Provider
} = require '../../../../common/cfx'

reducers = require '../reducers/index'
store = createStore reducers
Noder = require './Noder'

Topics = require '../components/Topics'

module.exports = ->

  Provider store: store
  ,
    Noder()
