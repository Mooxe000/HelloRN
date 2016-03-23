{ assign } = Object
{
  cfxify
} = require '../../../common/cfx'

SampleComponent = ->

  defaultName = 'FirstPageComponent'
  defaultComponent = FirstComponent

  Navigator

    initialRoute:

      name: defaultName
      component: defaultComponent

      configureScene: ->
        Navigator.SceneConfigs.HorizontalSwipeJump

      renderScene: (router, navigator) ->
        Component = router.component
        if router.component
          return Component do ->
            assign router.params
            , { navigator }
