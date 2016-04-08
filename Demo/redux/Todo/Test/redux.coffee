#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
test = require 'tape'
Immutable = require 'seamless-immutable'

{
  createStore
} = require '../../../../src/common/reduxHelper'

reducers =
  todoApp: require '../Client/reducers/index'
actions =
  todoApp: require '../Client/actions/index'

constants = (
  require '../Client/constants/index'
).Todo

{
  SHOW_ALL_TODO
  SHOW_COMPLETED_TODO
  SHOW_ACTIVE_TODO
} = constants.visibilityFilter

###
    Flow
###
{
  # loadTodoState
  addTodoState
  modifyTodoState
  removeTodoState
  setVisibilityFilter
} = actions.todoApp.Todo.State

#   init
store = createStore reducers

tasks = [
    actual: -> addTodoState
      text: 'Learn about actions'
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
          text: 'Learn about actions'
          completed: false
        ]
    msg: 'add todo'
  ,
    actual: -> addTodoState
      text: 'Learn about reducers'
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
            text: 'Learn about actions'
            completed: false
          ,
            text: 'Learn about reducers'
            completed: false
        ]
    msg: 'add todo'
  ,
    actual: -> addTodoState
      text: 'Learn about store'
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
            text: 'Learn about actions'
            completed: false
          ,
            text: 'Learn about reducers'
            completed: false
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'add todo'
  ,
    actual: -> modifyTodoState
      index: 0
      todo:
        text: 'Learn about sagas'
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
            text: 'Learn about sagas'
            completed: false
          ,
            text: 'Learn about reducers'
            completed: false
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'complete todo'
  ,
    actual: -> modifyTodoState
      index: 1
      todo:
        completed: true
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
            text: 'Learn about sagas'
            completed: false
          ,
            text: 'Learn about reducers'
            completed: true
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'complete todo'
  ,
    actual: -> removeTodoState
      index: 1
    expected:
      todoApp:
        visibilityFilter: SHOW_ALL_TODO
        todos: Immutable [
            text: 'Learn about sagas'
            completed: false
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'remove todo'
  ,
    actual: ->
      setVisibilityFilter
        filter: SHOW_COMPLETED_TODO
    expected:
      todoApp:
        visibilityFilter: SHOW_COMPLETED_TODO
        todos: Immutable [
            text: 'Learn about sagas'
            completed: false
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'setVisibilityFilter todo'
]

test 'Saga Test'
, (t) ->

  unsubscribe = store.subscribe ->
    state = store.getState()
    task = tasks.shift()
    dd state
    # dd task.expected
    t.deepEqual state
    , task.expected
    , task.msg

  for task in tasks.slice()
    store.dispatch task.actual()

  unsubscribe()

  t.end()
