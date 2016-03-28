echo = -> console.log arguments
{
  cfx
  Comps
  Styl
} = require '../../../../common/cfx'
{
  Text
  View
  TouchableHighlight
  ListView
} = Comps
RN = require 'react-native'
randomColor = require 'randomcolor'

# LeftCorner = (
#   require '../../jsx/components/LeftCorner'
# ).default
# RightCorner = (
#   require '../../jsx/components/RightCorner'
# ).default

LeftCorner = require '../components/LeftCorner'
RightCorner = require '../components/RightCorner'

styles = Styl
  container:
    flex: 1
  row:
    flex: 1
    flexDirection: 'row'
    justifyContent: 'center'
    alignItems: 'center'
    backgroundColor: '#F6F6F6'
    padding: 20
  separator:
    height: 1
    backgroundColor: '#CCCCCC'

getFeatures = (Page) -> [
    method: 'toRoute'
    route:
      component: Page
      name: 'toRoute()'
  ,
    method: 'replaceRoute'
    route:
      component: Page
      name: 'replaceRoute()'
  ,
    method: 'resetToRoute'
    route:
      component: Page
      name: 'resetToRoute()'
  ,
    method: 'toRoute'
    route:
      component: Page
      name: 'Random headerStyle'
      headerStyle:
        backgroundColor: randomColor()
  ,
    method: 'toRoute'
    route:
      component: Page
      name: '(Android) Random StatusBar color'
      statusBarProps:
        animated: true
        backgroundColor: randomColor()
  ,
    method: 'toRoute'
    route:
      component: Page
      name: 'Hide StatusBar'
      statusBarProps:
        animated: true
        hidden: true
  ,
    method: 'toRoute'
    route:
      component: Page
      name: 'Hide NavBar'
      hideNavigationBar: true
  ,
    method: 'toRoute'
    route:
      component: Page
      name: 'Hide NavBar & StatusBar'
      hideNavigationBar: true
      statusBarProps:
        animated: true
        hidden: true
  ,
    method: 'toRoute'
    route:
      component: Page
      name: [
        'Custom Components'
        'Left and right corners'
      ].join '\n'
      leftCorner: LeftCorner
      rightCorner: RightCorner
]

Page = cfx

  constructor: ->

    ds = new RN.ListView.DataSource
      rowHasChanged: (r1, r2) -> r1 isnt r2

    features = getFeatures Page

    @state =
      dataSource: ds.cloneWithRows features

    @selectedRow = {}

    @onPressRow = (feature) ->
      @props[feature.method] feature.route

    for feature in features
      @selectedRow[feature.route.name] =
        @onPressRow.bind @, feature

    return

  renderRow: (rowData) ->

    TouchableHighlight
      onPress: @selectedRow[rowData.route.name]
    ,
      View {}
      ,
        View style: styles.row
        ,
          Text {}
          , rowData.route.name
      ,
        View style: styles.separator

  render: ->

    View style: styles.container
    ,
      ListView
        dataSource: @state.dataSource
        renderRow: @renderRow

module.exports = Page
