{ assign } = Object
actions =
  todoApp: require '../../Client/actions/index'
{ modifyTodoState } = actions.todoApp.Todo

{ forPrintSiState } = require '../helper/index'

module.exports =

  msg: 'modify todo'

  expected: [
      index: 1
      todo:
        completed: true
    ,
      index: 2
      todo:
        text: 'Learn about redux'
  ]

  actual: (store, task, tasks) ->

    return if task.expected.length is 0
    waitObj = task.expected[0]
    store.dispatch modifyTodoState waitObj

  test: (store, task, tasks) ->

    return if task.expected.length is 0

    state = store.getState()
    { todos } = state.todoApp

    expected = task.expected.shift()

    dd forPrintSiState state.todoApp

    @deepEqual todos[expected.index].asMutable()
    , do ->
      r = {}
      for k, v of todos[expected.index]
        r[k] =
          if expected[k]
          then expected[k]
          else v
      r
    , task.msg

    unless task.expected.length is 0
      task.actual store
      , task
      , tasks
    else
      tasks.shift()
