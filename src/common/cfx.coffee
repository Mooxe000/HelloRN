echo = -> console.log arguments
{ assign } = Object
{
  Text
  View
  Image
  Navigator
  ListView

  TouchableHighlight
  TouchableOpacity
} = RN = require 'react-native'

{ Component } = require 'react'

cfxify = RN.createFactory
# cfxify = RN.createClass
Styl = RN.StyleSheet.create

Comp =
  reg: RN.AppRegistry.registerComponent
  new: (component) ->

    componentObj = {}

    if typeof component is 'function'

      componentObj.render = component

    else if typeof component is 'object'

      return unless component.render
      componentObj = assign {}, componentObj, component

    # TODO use throw error with error message
    else return

    class newComponent extends Component

      waitToBinds = []

      for k, v of componentObj
        continue if (
          k is 'render' or
          k is 'constructor'
        )

        # echo "#{k}: #{typeof v}"

        if typeof v is 'function'
          @::[k] = ->
            componentObj._pressButton
            .call @, @props, @state
          waitToBinds.push k
        else
          @::[k] = v

      constructor: (props) ->
        super props
        if componentObj.constructor
          componentObj.constructor
          .call @, @props, @state
        for funcName in waitToBinds
          @[funcName] = componentObj[funcName].bind @
        @

      render: ->
        componentObj.render.call @, @props, @state

cfx = (component) ->
  cfxify Comp.new component

Comps =
  View: cfxify View
  Text: cfxify Text
  Image: cfxify Image

  Navigator: cfxify Navigator
  ListView: cfxify ListView

  TouchableHighlight: cfxify TouchableHighlight
  TouchableOpacity: cfxify TouchableOpacity

exports.Styl = Styl
exports.Comp = Comp
exports.Comps = Comps

exports.RN = RN
exports.Alert = RN.Alert
exports.Platform = RN.Platform
exports.PropTypes = RN.PropTypes

exports.cfx = cfx
exports.cfxify = cfxify
