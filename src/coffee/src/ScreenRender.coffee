{
  StyleSheet
} = RN = require 'react-native'
{
  Text
} = require './common/cfx-components'

styles = StyleSheet.create

  screen:
    color: '#190d08'
    fontSize: 70
    fontWeight: '200'

module.exports = ->

  Text style: styles.screen
  , 1000
  # , 'state.displayScreen'
