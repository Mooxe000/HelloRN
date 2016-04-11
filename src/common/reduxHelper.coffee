echo = console.log
dd = require 'ddeyes'
{ assign } = Object
{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'

Immutable = require './immutableHelper'

createStoreWithMiddleware = (pluginList) -> (
  applyMiddleware.apply @, pluginList
) createStore

CreateStore = (reducers, pluginList = []) ->
  reducer = combineReducers reducers
  (
    createStoreWithMiddleware pluginList
  ) reducer

mergeReduce = (
  reduceMap
  defaultState
  options
) ->
  unless defaultState
    throw new Error 'must be provided a default state.'
  (state = defaultState, action) ->
    immutable =
      unless options?.immutable?
      then true
      else
        if options.immutable is false
        then false else true
    state = Immutable.init state if immutable
    r = {}
    for reduceName, reduce of reduceMap
      r[reduceName] = reduce state[reduceName], action
    r

###
  redux actions
###
{ createAction } = require 'redux-actions'
createActions = (config) ->
  actions = {}
  for k, v of config
    actions[k] = createAction v
  actions

###
  redux saga
###
saga = (
  require 'redux-saga'
).default
sagaEffects = require 'redux-saga/effects'
createSagaMiddleware = (sagas) ->
  saga.apply @, sagas
dispatch = (action, actionType) ->
  sagaEffects.put assign {}
  , action
  , type: actionType

###
  redux crud
###

underlineToHump = (name) ->
  words = name.split '_'
  words = words.reduce (result, key, index, array) ->
    if index is 0
      result.push key.toLowerCase()
    else
      keyArray = key.toLowerCase().split ''
      keyArray[0] = keyArray[0].toUpperCase()
      result.push keyArray.join ''
    result
  , []
  words.join ''

toActionsTypes = (typesObj) ->
  r =
    types: typesObj
    actions: {}
  for type in Object.keys r.types
    r.actions[underlineToHump type] = type
  r

crudActionsTypes = (routeName) ->
  routeName = routeName.toUpperCase()
  r = {}
  for kw in [
    'FETCH'
    'CREATE'
    'UPDATE'
    'DELETE'
  ]
    assign r, {
      "#{routeName}_#{kw}"
      "#{routeName}_#{kw}_START"
      "#{routeName}_#{kw}_SUCCESS"
      "#{routeName}_#{kw}_ERROR"
    }
  toActionsTypes r

# TODO can use object params
mergeActionsTypes = ->
  actionsTypesArray = []
  if arguments.length is 1
    if Array.isArray arguments[0]
      actionsTypesArray = arguments[0]
    else if typeof arguments[0] is 'object'
      for k, v of arguments[0]
        actionsTypesArray.push v
    else return # TODO throw
  else
    actionsTypesArray = arguments

  actionsTypesArray
  .reduce (result, actionsTypes, index, array) ->
    actions: assign {}
    , result.actions
    , actionsTypes.actions
    types: assign {}
    , result.types
    , actionsTypes.types
  ,
    actions: {}
    types: {}

module.exports = {
  createStore: CreateStore
  mergeReduce
  createActions
  createSagaMiddleware
  dispatch
  crudActionsTypes
  toActionsTypes
  mergeActionsTypes
}
