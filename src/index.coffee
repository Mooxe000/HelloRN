echo = -> console.log arguments
{ Comp } = require './common/cfx'

App =
  calculator: require './Apps/Calculator/components/App'
  counter:
    jsx: require './Apps/Counter/jsx/containers/app'
    cfx: require './Apps/Counter/cfx/containers/App'

  navigator:
    jsx: require './Apps/Navigator/jsx/containers/App'
    cfx: require './Apps/Navigator/cfx/containers/App'

  explorer:
    jsx: require './Apps/Explorer/jsx/containers/App'
    cfx: require './Apps/Explorer/cfx/containers/App'

  giftedListView:
    cfx: require './Apps/GiftedListView/cfx/containers/App'
    jsx: require './Apps/GiftedListView/jsx/containers/App'

currentApp =
  # name: 'calculator'
  name: 'counter'
  # name: 'navigator'
  # name: 'explorer'
  # name: 'giftedListView'

  type: 'cfx'
  # type: 'jsx'

Comp.reg 'HelloRN'
, ->
  currentApp.type = 'cfx' unless App[currentApp.name][currentApp.type]
  unless App[currentApp.name][currentApp.type]
    if App[currentApp.name].cfx
      Comp.new App[currentApp.name].cfx
    else if App[currentApp.name].jsx
      App[currentApp.name].jsx.default
    else
      Comp.new App[currentApp.name]
  else
    if currentApp.type is 'cfx'
      Comp.new App[currentApp.name].cfx
    else
      App[currentApp.name].jsx.default
