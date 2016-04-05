echo = console.log
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

module.exports = {
  createStore: CreateStore
  mergeReduce
  createActions
}
