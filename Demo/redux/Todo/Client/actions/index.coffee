{
  createActions
} = require '../../../../../src/common/reduxHelper'

constants = (
  require '../constants/index'
).Todo

Todo = createActions constants.actions

module.exports = {
  Todo
}
