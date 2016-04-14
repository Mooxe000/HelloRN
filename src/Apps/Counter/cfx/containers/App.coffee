echo = -> console.log arguments

{
  cfx
  cfxify
} = require '../../../../common/cfx'

{ createStore } = require '../../../../common/reduxHelper'
{ Provider } = require '../../../../common/reactReduxHelper'

reducers = require '../reducers/index'

createLogger = require 'redux-logger'
logger = createLogger()

store = createStore reducers
, [ logger ]

# CounterApp = cfxify (
#   require '../../jsx/containers/counterApp'
# ).default

CounterApp = require './CounterApp'

module.exports = cfx ->

  Provider store: store
  ,
    CounterApp()
