{
  cfxify
  Comps
} = require '../../../common/cfx'
{
  View
  Text
  TouchableOpacity
} = Comps

SecondPageComponent = require './Second'

FirstComponent = cfxify

  constructor: ->
    @state =
      id: 1
      user: null

  _pressButton: ->
    self = @
    { navigator } = @props

    if navigator

      navigator.push

        name: 'SecondPageComponent'
        component: SecondPageComponent

        params:
          id: @state.id
          getUser: (user) ->
            self.setState user: user

  render: ->

    if @state.user

      View {}
      ,
        Text {}
        , "用户信息: #{JSON.stringify @state.user}"

    else

      View style:
        backgroundColor: '#c7c7c7'
        flex: 1
      ,
        Text {}
        , FirstComponent
      ,
        TouchableOpacity
          onPress: @_pressButton.bind @
        ,
          Text {}
          , "点我查询用户 id = #{@state.id}"

module.exports = FirstComponent
