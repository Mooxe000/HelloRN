{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'

Comp.reg 'HelloRN'
, -> Comp.new App.calculator
