types = require '../actions/types'
___ = require '../../../../common/assign'

initialState = topics: []

topics = (
  state = initialState
  action = {}
) ->

  {
    payload
    error
    meta = {}
    type
  } = action
  {
    sequence = {}
    tab
    id = '0'
  } = meta

  switch action.type

    when types.GET_TOPICS_FROM_STORAGE
      return ___ state, payload

    else return state

module.exports = topics
