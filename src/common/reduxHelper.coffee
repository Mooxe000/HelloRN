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
createSagaMiddleware = (sagas) ->
  saga.apply @, sagas

###
  redux crud
###
reduxCrud = require 'redux-crud'
crudActionsTypes = (routeName) ->
  crudTypes = reduxCrud.actionTypesFor routeName
  Object.keys crudTypes
  .reduce (result, key, index, keys) ->
    if crudTypes[key] is key
      result.types[key] = crudTypes[key]
    else
      result.actions[key] = crudTypes[key]
    result
  ,
    types: {}
    actions: {}

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

mergeActionsTypes = (actionsTypesArray...) ->
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
  crudActionsTypes
  toActionsTypes
  mergeActionsTypes
}
