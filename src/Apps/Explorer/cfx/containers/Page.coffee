echo = -> console.log arguments
{
  cfx
  cfxify
  Comps
  Styl
} = require '../../../../common/cfx'
{
  Text
  View
  TouchableHighlight
} = Comps
{
  Component
  ListView
} = require 'react-native'

LeftCorner = (
  require '../../jsx/components/LeftCorner'
).default
RightCorner = (
  require '../../jsx/components/RightCorner'
).default

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

bgcRandom = Math.floor(
  Math.random() * 16777215
).toString 16 + ''

features = [
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
        backgroundColor: bgcRandom
  ,
    method: 'toRoute'
    route:
      component: Page
      name: '(Android) Random StatusBar color'
      statusBarProps:
        animated: true
        backgroundColor: bgcRandom
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

class Page extends Component
  constructor: (props) ->
    super props

    ds = new ListView.DataSource
      rowHasChanged: (r1, r2) => r1 isnt r2

    feature = feature[0]

    @state = dataSource: ds.cloneWithRows features
    @selectedRow = {}

    # for feature in features
    #   @selectedRow[feature.route.name] =
    #     @onPressRow.bind @, feature
    #
    # @renderRow = @renderRow.bind @

    return

  onPressRow: (feature) ->
    @props[feature.method] feature.route

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
      Comps.ListView
        dataSource: @state.dataSource
        randerRow: @renderRow

module.exports = Page
