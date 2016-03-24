{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'
  counter: require './Apps/Counter/containers/App'

  # navigator: require './Apps/Navigator/es6/sample'
  navigator: require './Apps/Navigator/containers/App'

Comp.reg 'HelloRN'

# , -> App.navigator.default

, -> Comp.new(
  # App.calculator
  # App.counter
  App.navigator
)
