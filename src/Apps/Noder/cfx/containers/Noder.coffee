___ = require '../../../../common/assign'
{
  cfxify
  cfx
  connect
} = require '../../../../common/cfx'

Topics = require '../components/Topics'
TopicsActions = require '../actions/TopicsActions'

TopicsApp = cfx ->
  {
    state
    actions
  } = @props

  Topics(
    ___ actions
    , topics: state.topics
  )

module.exports = cfxify connect 'topics'
  , TopicsActions
  , TopicsApp
