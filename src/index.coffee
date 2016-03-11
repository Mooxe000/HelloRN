{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'
  counter: require './Apps/Counter/components/Counter'

Comp.reg 'HelloRN'
, -> Comp.new(
  # App.calculator
  App.counter
)
