{
  createActions
} = require '../../../../src/common/reduxHelper'
{
  INCREMENT
  DECREMENT
} = require '../constants/index'

actions =
  increment: INCREMENT
  decrement: DECREMENT

module.exports = createActions actions
