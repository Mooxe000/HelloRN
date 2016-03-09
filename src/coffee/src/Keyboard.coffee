{
  cfxify
  Comp
  Comps
  Styl
} = require './common/cfx'

{
  View
  Text
} = Comps

Key = cfxify require './Key'

styles = Styl

  keyboard:
    flex: 1

  row:
    flex: 1
    flexDirection: 'row'

module.exports = ->

  View style: styles.keyboard
  ,

    View style: styles.row
    ,
      Key
        keyType: 'number'
        keyValue: '1'
        KeySymbol: '1'
    ,
      Key
        keyType: 'number'
        keyValue: '2'
        KeySymbol: '2'
    ,
      Key
        keyType: 'number'
        keyValue: '3'
        KeySymbol: '3'

    View style: styles.row
    ,
      Key
        keyType: 'number'
        keyValue: '4'
        KeySymbol: '4'
    ,
      Key
        keyType: 'number'
        keyValue: '5'
        KeySymbol: '5'
    ,
      Key
        keyType: 'number'
        keyValue: '6'
        KeySymbol: '6'

    View style: styles.row
    ,
      Key
        keyType: 'number'
        keyValue: '7'
        KeySymbol: '7'
    ,
      Key
        keyType: 'number'
        keyValue: '8'
        KeySymbol: '8'
    ,
      Key
        keyType: 'number'
        keyValue: '9'
        KeySymbol: '9'

    View style: styles.row
    ,
      Key
        keyType: 'number'
        keyValue: '+-'
        KeySymbol: '+/-'
    ,
      Key
        keyType: 'number'
        keyValue: '0'
        KeySymbol: '0'
    ,
      Key
        keyType: 'number'
        keyValue: '.'
        KeySymbol: '.'

    View style: styles.row
    ,
      Key
        keyType: 'operator'
        keyValue: 'divide'
        KeySymbol: '÷'
    ,
      Key
        keyType: 'operator'
        keyValue: 'substract'
        KeySymbol: '-'
    ,
      Key
        keyType: 'operator'
        keyValue: 'add'
        KeySymbol: '+'
    ,
      Key
        keyType: 'operator'
        keyValue: 'multiply'
        KeySymbol: 'x'

    View style: styles.row
    ,
      Key
        keyType: 'action'
        keyValue: 'back'
        KeySymbol: '<<'
    ,
      Key
        keyType: 'action'
        keyValue: 'equal'
        KeySymbol: '='
