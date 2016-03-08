{
  Text
  View
} = require '../common/cfx-components'

module.exports = (styles, funcs) ->

  View style: styles.container
  ,
    Text style: styles.welcome
    , 'Welcome to React Native!'
  ,
    Text style: styles.instructions
    , 'To get started, edit index.ios.js'
  , funcs.notice()
