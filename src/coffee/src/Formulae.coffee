Render = require './FormulaeRender'
{ Component } = require 'react'

class Formulae extends Component
  render: ->
    Render.call @
    , @props, @state

module.exports = Formulae
