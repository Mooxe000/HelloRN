Render = require './KeyRender'
{ Component } = require 'react'

class Key extends Component
  render: ->
    Render.call @
    , @props, @state

module.exports = Key
