{
  PropTypes
  Comps
  Styl
  cfx
} = require '../../../../common/cfx'
{
  View
  Image
  TouchableHighlight
} = Comps

styles = Styl
  container:
    flex: 1
  button:
    padding: 5

LeftCorner = cfx

  onPress: -> @props.toBack()

  render: ->

    View style: styles.container
    ,
      TouchableHighlight
        style: styles.button
        onPress: @onPress
        underlayColor: 'transparent'
      ,
        Image source: require '../../images/ic_chevron_left_white.png'

LeftCorner.propTypes = toBack: PropTypes.func.isRequired
module.exports = LeftCorner
