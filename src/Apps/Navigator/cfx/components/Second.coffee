{
  cfxify
  Comps
} = require '../../../../common/cfx'
{
  View
  Text
  TouchableOpacity
} = Comps

SecondPageComponent = cfxify

  constructor: ->
    @USER_MODELS =
      1:
        name: '小明'
        age: 23
    @

  _pressButton: ->
    { navigator } = @props

    if @props.getUser
      user = @USER_MODELS[@props.id]
      @props.getUser user

    navigator.pop() if navigator

  componentDidMount: ->
    @setState
      id: @props.id

  render: ->

    View
      style:
        backgroundColor: '#f9f9f9'
        flex: 1
    ,
      Text {}
      , 'SecondPageComponent'
    ,
      TouchableOpacity
        onPress: @_pressButton.bind @
      ,
        Text {}
        , '返回'

module.exports = SecondPageComponent
