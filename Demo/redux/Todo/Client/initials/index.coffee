constants = (
  require '../constants/index'
).Todo
{ SHOW_ALL_TODO } = constants.visibilityFilter

Todo = ->

  initial =
    visibilityFilter: SHOW_ALL_TODO
    todo: (text) -> {
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
