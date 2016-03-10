{
  cfxify
  Comps
  Styl
} = require '../../../common/cfx'
{ assign } = Object

{
  Text
  View
  TouchableHighlight
} = Comps

styles = Styl

  formulae:
    flexWrap: 'wrap'
    alignItems: 'center'
    justifyContent: 'center'

  text:
    fontSize: 18

getFormulaStyles = (operator) ->

  button =

    basic:
      borderRadius: 10
      alignItems: 'center'
      justifyContent: 'center'
      padding: 8
      marginLeft: 10

    add:
      backgroundColor: '#fb96cf'

    substract:
      backgroundColor: '#fcb064'

    multiply:
      backgroundColor: '#68cef1'

    divide:
      backgroundColor: '#cb7dc9'

  assign button.basic
  , button[operator]

module.exports = cfxify ->

  View style: styles.formulae
  ,
    TouchableHighlight
      style: getFormulaStyles 'substract'
      key: 1
      underlayColor: '#cdcdcd'
    ,
      Text style: styles.text
      , '3+2'
