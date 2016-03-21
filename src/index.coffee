{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'
  counterES5: require './Apps/Counter/containers/App'
  counterES6: require './Apps/CounterES2015/containers/app'

ES5 = Comp.new(
  # App.calculator
  App.counterES5
)

ES6 = (
  App.counterES6
).default

Comp.reg 'HelloRN'
, -> ES5
