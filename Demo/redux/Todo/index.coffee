#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
test = require 'tape'

{
  createStore
} = require '../../../src/common/reduxHelper'

reducers =
  todoApp: require './reducers/Todo'
actions =
  todoApp: require './actions/Todo'

VisibilityFilters = require './constants/Visibility'

Immutable = require 'seamless-immutable'

###
    Flow
###
{
  addTodo
  removeTodo
  completeTodo
  setVisibilityFilter
} = actions.todoApp

#   init
store = createStore reducers

tasks = [
    actual: -> addTodo
      text: 'Learn about actions'
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
        todos: Immutable [
          text: 'Learn about actions'
          completed: false
        ]
    msg: 'add todo'
  ,
    actual: -> addTodo
      text: 'Learn about reducers'
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
        todos: Immutable [
            text: 'Learn about actions'
            completed: false
          ,
            text: 'Learn about reducers'
            completed: false
        ]
    msg: 'add todo'
  ,
    actual: -> addTodo
      text: 'Learn about store'
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
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
    actual: -> completeTodo
      index: 0
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
        todos: Immutable [
            text: 'Learn about actions'
            completed: true
          ,
            text: 'Learn about reducers'
            completed: false
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'complete todo'
  ,
    actual: -> completeTodo
      index: 1
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
        todos: Immutable [
            text: 'Learn about actions'
            completed: true
          ,
            text: 'Learn about reducers'
            completed: true
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'complete todo'
  ,
    actual: -> removeTodo
      index: 1
    expected:
      todoApp:
        visibilityFilter: 'SHOW_ALL'
        todos: Immutable [
            text: 'Learn about actions'
            completed: true
          ,
            text: 'Learn about store'
            completed: false
        ]
    msg: 'remove todo'
  ,
    actual: -> setVisibilityFilter
      filter:
        VisibilityFilters
        .SHOW_COMPLETED
    expected:
      todoApp:
        visibilityFilter: 'SHOW_COMPLETED'
        todos: Immutable [
            text: 'Learn about actions'
            completed: true
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
