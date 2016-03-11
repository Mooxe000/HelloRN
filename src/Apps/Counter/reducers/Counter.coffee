types = require '../actions/ActionTypes.coffee'
{ assign } = Object

initialState = count: 0

counter = (
  state = initialState
  action = {}
) ->

  switch action.type
    when types.INCREMENT
      return (
        assign state
        , count: state.count + 1
      )
    when types.DECREMENT
      return (
        assign state
        , count: state.count - 1
      )
    else return state

module.exports = counter
