###
# React
###
{ assign } = Object
{
  Text
  View
  TouchableHighlight
  TouchableOpacity
  Navigator
} = RN = require 'react-native'

{ Component } = require 'react'

cfx = RN.createFactory
Styl = RN.StyleSheet.create

Comp =
  reg: RN.AppRegistry.registerComponent
  new: (component) ->

    componentObj = {}

    if typeof component is 'function'

      componentObj.render = component

    else if typeof component is 'object'

      return unless component.render
      componentObj = assign componentObj, component

    else return

    class newComponent extends Component

      constructor: (props) ->
        super props
        if componentObj.constructor
          componentObj.constructor
          .call @, @props, @state
        @

      for k, v of componentObj
        continue if (
          k is 'render' or
          k is 'constructor'
        )

        if typeof v is 'function'
          @::[k] = ->
            componentObj._pressButton
            .call @, @props, @state
        else
          @::[k] = v

      render: ->
        componentObj.render.call @, @props, @state

cfxify = (component) ->
  cfx Comp.new component

Comps =
  View: cfx View
  Text: cfx Text
  TouchableHighlight: cfx TouchableHighlight
  TouchableOpacity: cfx TouchableOpacity
  Navigator: cfx Navigator

###
# Redux
###
{
  createStore
  applyMiddleware
  combineReducers
  bindActionCreators
} = require 'redux'

thunk = require 'redux-thunk'
logger = require 'redux-logger'

createStoreWithMiddleware = (
  applyMiddleware thunk.default
  , logger()
) createStore

ReactRedux = require '../libs/react-redux/index'

createStore = (reducers) ->
  reducer = combineReducers reducers
  createStoreWithMiddleware reducer

connect = (stateName, actions, Component) ->
  ReactRedux.connect(
    (state) ->
      state: state[stateName]
    (dispatch) ->
      actions:
        bindActionCreators actions, dispatch
  ) Component

###
# React
###
exports.cfx = cfx
exports.Styl = Styl
exports.Comp = Comp
exports.Comps = Comps
exports.cfxify = cfxify
###
# Redux
###
exports.createStore = createStore
exports.Provider = cfx ReactRedux.Provider
exports.connect = connect
