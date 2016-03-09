Render = require './KeyboardRender'
{ Component } = require 'react'

class Keyboard extends Component
  render: ->
    Render.call @
    , @props, @state

module.exports = Keyboard
