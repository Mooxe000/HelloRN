Render = require './AppRender'
RN = require 'react-native'

module.exports = RN.createClass
  render: ->
    Render.call @
    , @props, @state
