echo = console.log
dd = require 'ddeyes'
EE = require './EventEmitter'

{ initial } = (
  require '../../Client/initials/index'
).Todo()

module.exports = (store, tasks, action) ->
  { dispatch } = store

  try
    { waitList } = action.payload
  catch ex

  unless waitList

    waitList = [
      "Learn about actions"
      "Learn about reducers"
      "Learn about store"
      'Learn about sagas'
    ]

  unless waitList.length is 0

    return EE.emit 'todoCreate'
    , dispatch
    ,
      todo: initial.todo waitList.shift()
      waitList: waitList

  else

    return EE.emit 'tasksShift'
    , store, tasks
