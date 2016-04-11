cuid = require 'cuid'
constants = (
  require '../constants/index'
).Todo
{ SHOW_ALL_TODO } = constants.types

Todo = ->

  initial =
    visibilityFilter: SHOW_ALL_TODO
    todo: (text) -> {
      id: cuid()
      text
      completed: false
    }

  {
    initial
    initialState:
      # TODO coffee support
      #   { visibilityFilter }: initial
      visibilityFilter: initial.visibilityFilter
      todos: []
  }

module.exports = {
  Todo
}
