{
  Platform
  StyleSheet
} = RN = require 'react-native'

{
  Text
} = require '../common/cfx-components'

styles = StyleSheet.create require './style'
layout = require './layout'

funcs =
  notice: ->

    if Platform.OS is 'ios'

      Text style: styles.instructions
      ,
        """
        Press Cmd+R to reload,
        Cmd+D or shake for dev menu
        """

    else

      Text style: styles.instructions
      , 'Shake or press menu button for dev menu'

module.exports = ->
  layout styles, funcs
