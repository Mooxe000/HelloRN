{ createAction } = require 'redux-actions'
types = require './types'
storage = require '../storages/storage'

storeTopicsRequest =
  createAction types.STORE_TOPICS_REQUEST
storeTopicsFailure =
  createAction types.STORE_TOPICS_FAILURE
storeTopicsSuccess =
  createAction types.STORE_TOPICS_SUCCESS

storeTopics = ->

module.exports = {
  storeTopicsRequest
  storeTopicsFailure
  storeTopicsSuccess
}

  # storage.load
  #   key: 'topics'
  #   autoSync: true
  # .then (ret) ->
  #   console.log ret
  # .catch (err) ->
  #   console.warn err
