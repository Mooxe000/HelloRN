echo = -> console.log arguments
{
  Platform
} = require 'react-native'

{
  Comp
  Comps
  Styl
} = require '../../../common/cfx'

{
  View
  Text
} = Comps

Screen = require './Screen'
Formulae = require './Formulae'
Keyboard = require './Keyboard'

styles = Styl

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
    View style: styles.formulae
    , Formulae()
  ,
    View style: styles.keyboard
    , Keyboard()
