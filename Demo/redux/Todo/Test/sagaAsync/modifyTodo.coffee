echo = console.log
dd = require 'ddeyes'
EE = require './EventEmitter'

module.exports = (dispatch, action, tasks, store) ->

  return EE.emit 'todoFetch'
  , dispatch unless action

  try
    {
      todos
    } = action.payload
  catch ex

  # if todos

  return EE.emit 'tasksShift'
  , dispatch, action
  , tasks, store
