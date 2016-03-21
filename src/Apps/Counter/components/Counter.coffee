{
  Comps
  Styl
  cfxify
} = require '../../../common/cfx'

{
  View
  Text
  TouchableOpacity
} = Comps

styles = Styl
  root:
    flex: 1
    alignItems: 'center'
    justifyContent: 'center'

  button:
    width: 100
    height: 30
    padding: 10
    backgroundColor: 'lightgray'
    alignItems: 'center'
    justifyContent: 'center'
    margin: 3

module.exports = cfxify ->

  {
    counter
    increment
    decrement
  } = @props

  View style: styles.root
  ,
    Text {}
    , counter
  ,
    TouchableOpacity
      onPress: increment
      style: styles.button
    ,
      Text {}
      , 'up'
  ,
    TouchableOpacity
      onPress: decrement
      style: styles.button
    ,
      Text {}
      , 'down'
