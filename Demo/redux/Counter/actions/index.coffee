{
  createActions
} = require '../../../../src/common/reduxHelper'
{
  INCREMENT
  INCREMENT_ASYNC
  DECREMENT
  DECREMENT_ASYNC
} = require '../constants/index'

actions =
  increment: INCREMENT
  incrementAsync: INCREMENT_ASYNC
  decrement: DECREMENT
  decrementAsync: DECREMENT_ASYNC

module.exports = createActions actions
