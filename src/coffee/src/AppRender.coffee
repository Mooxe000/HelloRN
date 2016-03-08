{
  StyleSheet
  Platform
} = RN = require 'react-native'

{ cfxify } = require './common/cfx'

{
  View
  Text
} = require './common/cfx-components'

Screen = cfxify require './Screen'
# Formulae = cfxify require './Formulae'
# Keyboard = cfxify require './Keyboard'

styles = StyleSheet.create

  container:
    flex: 1

  screen:
    flex: 3
    flexDirection: 'row'
    alignItems:
      if Platform.OS is 'android'
      then 'center'
      else 'flex-end'
    justifyContent: 'flex-end'
    backgroundColor: '#68cef2'
    padding: 18

  formulae:
    flex: 1
    flexDirection: 'row'
    justifyContent: 'flex-end'
    backgroundColor: '#4c4c4c'
    padding: 20

  keyboard:
    height: 420

module.exports = ->

  View style: styles.container
  ,
    View style: styles.screen
    , Screen()
  ,
    Text style: styles.formulae
    , 'Formulae'
  ,
    Text style: styles.keyboard
    , 'keyboard'
