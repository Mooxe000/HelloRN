Render = require './AppRender/index'
RN = require 'react-native'

module.exports = RN.createClass
  render: ->
    Render.call @
    , @props, @state
