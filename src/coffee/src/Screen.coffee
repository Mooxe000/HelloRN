{
  cfxify
  Comps
  Styl
} = require './common/cfx'
{
  Text
} = Comps

styles = Styl

  screen:
    color: '#190d08'
    fontSize: 70
    fontWeight: '200'

module.exports = cfxify ->

  Text style: styles.screen
  , 1000
  # , 'state.displayScreen'
