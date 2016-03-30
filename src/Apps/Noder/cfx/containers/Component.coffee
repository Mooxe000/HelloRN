Topics = require '../components/Topics'
{ cfx } = require '../../../../common/cfx'

storage = require '../storages/storage'

topics = storage.load
  key: 'topics'
  autoSync: true
  syncInBackground: true

module.exports = cfx ->

  Topics {topics}
