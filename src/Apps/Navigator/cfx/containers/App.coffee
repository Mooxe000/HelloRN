{ assign } = Object
{
  cfxify
  Comps
} = require '../../../../common/cfx'
{ Navigator } = require 'react-native'

FirstComponent = require '../components/First'

SampleComponent = cfxify ->

  defaultName = 'FirstPageComponent'
  defaultComponent = FirstComponent

  Comps.Navigator

    initialRoute:

      name: defaultName
      component: defaultComponent

    configureScene: ->
      Navigator.SceneConfigs.HorizontalSwipeJump

    renderScene: (router, navigator) ->
      Component = router.component
      if router.component
        Component do ->
          assign {}, router.params
          , { navigator }

module.exports = SampleComponent
