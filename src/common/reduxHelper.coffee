{
  createStore
  applyMiddleware
  combineReducers
} = require 'redux'

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
) ->
  unless defaultState
    throw new Error 'must be provided a default state.'
  (state = defaultState, action) ->
    r = {}
    for reduceName, reduce of reduceMap
      r[reduceName] = reduce state[reduceName], action
    r

module.exports = {
  createStore: CreateStore
  mergeReduce
}
