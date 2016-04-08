{
  createActions
} = require '../../../../../src/common/reduxHelper'

constants = (
  require '../constants/index'
).Todo

Todo =
  Entry: createActions constants.Entry.actions
  ToBE: createActions constants.ToBE.actions
  State: createActions constants.State.actions

module.exports = {
  Todo
}
