Render = require './AppRender'
{ Component } = require 'react'

class App extends Component
  render: ->
    Render.call @
    , @props, @state

module.exports = App
