echo = -> console.log arguments
{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'
  counter: require './Apps/Counter/containers/App'

  navigator:
    jsx: require './Apps/Navigator/jsx/containers/App'
    cfx: require './Apps/Navigator/cfx/containers/App'

  explorer:
    jsx: require './Apps/Explorer/jsx/containers/App'
    cfx: require './Apps/Explorer/cfx/containers/App'

currentApp =
  # name: 'navigator'
  name: 'explorer'
  type: 'cfx'
  # type: 'jsx'

Comp.reg 'HelloRN'
, ->
  currentApp.type = 'cfx' unless currentApp.type
  unless App[currentApp.name][currentApp.type]
    if App[currentApp.name].cfx
      echo 1
      Comp.new App[currentApp.name].cfx
    else if App[currentApp.name].jsx
      echo 2
      App[currentApp.name].jsx.default
    else
      echo 3
      Comp.new App[currentApp.name]
  else
    if currentApp.type is 'cfx'
      echo 4
      Comp.new App[currentApp.name].cfx
    else
      echo 5
      App[currentApp.name].jsx.default
