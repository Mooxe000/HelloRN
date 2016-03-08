Render = require './ScreenRender'
{ Component } = require 'react'

class Screen extends Component
  render: ->
    Render.call @
    , @props, @state

module.exports = Screen
