###
# React
###
{
  Text
  View
  TouchableHighlight
  TouchableOpacity
} = RN = require 'react-native'

{ Component } = require 'react'

cfx = RN.createFactory
Styl = RN.StyleSheet.create

Comp =
  reg: RN.AppRegistry.registerComponent
  new: (Render) ->
    class newComponent extends Component
      counstructor: (props) ->
        super props
      render: ->
        Render.call @
        , @props, @state

cfxify = (Render) -> cfx Comp.new Render

Comps =
  View: cfx View
  Text: cfx Text
  TouchableHighlight: cfx TouchableHighlight
  TouchableOpacity: cfx TouchableOpacity

###
# Redux
###
{
  createStore
  applyMiddleware
  combineReducers
  bindActionCreators
} = require 'redux'

thunk = (
  require 'redux-thunk'
).default

createStoreWithMiddleware = (
  applyMiddleware thunk
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
