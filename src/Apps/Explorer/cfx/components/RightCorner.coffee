{
  Styl
  Alert
  Comps
  cfxify
} = require '../../../../common/cfx'
{
  View
  TouchableHighlight
  Image
} = Comps

styles = Styl
  container:
    flex: 1
  button:
    padding: 5
    marginRight: 5

RightCorner = cfxify

  onPress: ->

    Alert.alert 'Alert Title'
    , 'My Alert Msg'
    , [
      text: 'OK'
      onPress: -> {}
    ]

  render: ->

    View style: styles.container
    ,
      TouchableHighlight
        style: styles.button
        onPress: @onPress
        underlayColor: 'transparent'
      ,
        Image source: require '../../images/ic_account_circle_white.png'

module.exports = RightCorner
