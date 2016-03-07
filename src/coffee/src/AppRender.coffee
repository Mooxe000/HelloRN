{
  Platform
  StyleSheet
  Text
  View
} = RN = require 'react-native'

styles = StyleSheet.create
  container:
    flex: 1
    justifyContent: 'center'
    alignItems: 'center'
    backgroundColor: '#F5FCFF'
  welcome:
    fontSize: 20
    textAlign: 'center'
    margin: 10
  instructions:
    textAlign: 'center'
    color: '#333333'
    marginBottom: 5

notice = ->
  if Platform.OS is 'ios'
    RN.createElement Text
    , style: styles.instructions
    ,
      """
      Press Cmd+R to reload,
      Cmd+D or shake for dev menu
      """
  else
    RN.createElement Text
    , style: styles.instructions
    , 'Shake or press menu button for dev menu'

module.exports = ->
  RN.createElement View
  , style: styles.container
  , (
    RN.createElement Text
    , style: styles.welcome
    , 'Welcome to React Native!'
  )
  , (
    RN.createElement Text
    , style: styles.instructions
    , 'To get started, edit index.ios.js'
  )
  , notice()
