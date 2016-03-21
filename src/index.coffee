{ Comp } = require './common/cfx'

App =
  calculator: Comp.new require './Apps/Calculator/components/App'
  # counter: Comp.new require './Apps/Counter/containers/App'
  counter: (require './Apps/CounterES2015/containers/app').default

Comp.reg 'HelloRN'
, ->
  # App.calculator
  App.counter
