echo = -> console.log arguments
{
  cfx
  cfxify
  Styl
  Comps
} = require '../../../../common/cfx'
{
  Text
  View
  TouchableHighlight
} = Comps
RN = require 'react-native'
{ Component } = require 'react'

GiftedListView = cfx require 'react-native-gifted-listview'

styles = Styl
  container:
    flex: 1
    backgroundColor: '#FFF'
  navBar:
    height: 64
    backgroundColor: '#CCC'
  row:
    padding: 10
    height: 44

Example = cfxify

  _onFetch: (
    page = 1
    callback
    options
  ) ->
    setTimeout ( =>
      rows = [
        "row #{(page - 1) * 3 + 1}"
        "row #{(page - 1) * 3 + 2}"
        "row #{(page - 1) * 3 + 3}"
      ]
      if page is 3
        callback rows
        , allLoaded: true
      else callback rows
    ), 1000

  _renderRowView: (rowData) ->

    TouchableHighlight
      style: styles.row
      underlayColor: '#c8c7cc'
      onPress: => @_onPress rowData
    ,
      Text {}
      , rowData


  _onPress: (rowData) ->
    echo "#{rowData} pressed"

  render: ->

    View style: styles.container
    ,
      View style: styles.navBar
    ,
      GiftedListView
        rowView: @_renderRowView
        onFetch: @_onFetch
        firstLoader: true
        pagination: true
        refreshable: true
        withSections: false

module.exports = Example
