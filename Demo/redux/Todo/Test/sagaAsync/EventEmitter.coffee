echo = console.log
dd = require 'ddeyes'

EventEmitter = require 'eventemitter3'

actions =
  todoApp: require '../../Client/actions/index'

{ forPrintSiState } = require '../helper/index'

{
  todoFetch
  todoCreate
  todoUpdate
  todoDelete
} = actions.todoApp.Todo

EE = new EventEmitter()

EE.on 'todoFetch'
, (dispatch, action = {}) ->
  dispatch todoFetch action

EE.on 'todoCreate'
, (dispatch, action = {}) ->
  dispatch todoCreate action

EE.on 'todoUpdate'
, (dispatch, action = {}) ->
  dispatch todoUpdate action

EE.on 'todoDelete'
, (dispatch, action) ->
  dispatch todoDelete action

EE.on 'tasksShift'
, (store, tasks) ->
  tasks.shift()
  dd forPrintSiState store.getState().todoApp
  tasks[0] store, tasks

module.exports = EE
