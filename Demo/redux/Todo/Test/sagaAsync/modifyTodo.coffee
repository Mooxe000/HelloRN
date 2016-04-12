echo = console.log
dd = require 'ddeyes'
{ assign } = Object

EE = require './EventEmitter'
isEqual = require 'is-equal'

module.exports = (store, tasks, action) ->

  return EE.emit 'todoFetch'
  , store.dispatch unless action

  expected = [
      index: 1
      todo:
        completed: true
    ,
      index: 2
      todo:
        text: 'Learn about redux'
  ]

  try
    { todos } = action.payload
  catch ex

  if todos

    unless isEqual todos
    , store.getState().todoApp.todos
      throw new Error 'todoFetch Error.'

    waitList = []

    for waitConf in expected
      waitList.push
        index: waitConf.index
        todo: assign {}
        , todos[waitConf.index]
        , waitConf.todo

    return EE.emit 'todoUpdate'
    , store.dispatch
    ,
      assign {}
      , waitList.shift()
      , { waitList }

  try
    { waitList } = action.payload
  catch ex

  if waitList

    unless waitList.length is 0

      return EE.emit 'todoUpdate'
      , store.dispatch
      ,
        assign {}
        , waitList.shift()
        , { waitList }

    else

      return EE.emit 'tasksShift'
      , store, tasks
