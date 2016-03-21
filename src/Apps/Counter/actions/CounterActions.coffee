types = require './ActionTypes'

module.exports =
  increment: ->
    type: types.INCREMENT
  decrement: ->
    type: types.DECREMENT
