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
    class Comp extends Component
      render: ->
        Render.call @
        , @props, @state
    Comp

Comps =
  View: cfx View
  Text: cfx Text
  TouchableHighlight: cfx TouchableHighlight
  TouchableOpacity: cfx TouchableOpacity



exports.cfx = cfx
exports.Styl = Styl
exports.Comp = Comp
exports.Comps = Comps
