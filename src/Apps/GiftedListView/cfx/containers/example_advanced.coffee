echo = -> console.log arguments
{ assign } = Object
{
  cfx
  cfxify
  Comps
} = require '../../../../common/cfx'
{
  Text
  View
  TouchableHighlight
} = Comps

GiftedListView = cfxify require 'react-native-gifted-listview'

{
  customStyles
  screenStyles
} = require './example_advanced_style'

{
  sectionHeaderView

  paginationFetchigView
  paginationAllLoadedView
  paginationWaitingView

  refreshableFetchingView
  refreshableWillRefreshView
  refreshableWaitingView

  emptyView
  separatorView
} = require './example_advanced_sub_render'

Example = cfx

  _onFetch: (
    page = 1
    callback
    options
  ) ->
    setTimeout ( =>
      header = "Header #{page}"
      rows = {}
      rows[header] = [
        "row #{(page - 1) * 3 + 1}"
        "row #{(page - 1) * 3 + 2}"
        "row #{(page - 1) * 3 + 3}"
      ]
      if page is 5
        callback rows
        # the end of the list is reached
        , allLoaded: true
      else callback rows
    ), 1000

  _onPress: (rowData) ->
    echo "#{rowData} pressed"

  _renderRowView: (rowData) ->

    TouchableHighlight
      style: customStyles.row
      underlayColor: '#c8c7cc'
      onPress: => @_onPress rowData
    ,
      Text {}
      , rowData

  _renderSectionHeaderView: sectionHeaderView

  _renderPaginationFetchigView: paginationFetchigView
  _renderPaginationAllLoadedView: paginationAllLoadedView
  _renderPaginationWaitingView: paginationWaitingView

  _renderRefreshableFetchingView: refreshableFetchingView
  _renderRefreshableWillRefreshView: refreshableWillRefreshView
  _renderRefreshableWaitingView: refreshableWaitingView

  _renderEmptyView: emptyView
  _renderSeparatorView: separatorView

  render: ->

    View style: screenStyles.container
    ,
      View style: screenStyles.navBar
      ,
        Text style: screenStyles.navBarTitle
        , 'Gifted ListView'
    ,
      GiftedListView
        rowView: @_renderRowView
        onFetch: @_onFetch
        initialListSize: 12

        firstLoader: true
        pagination: true

        paginationFetchigView: @_renderPaginationFetchigView
        paginationAllLoadedView: @_renderPaginationAllLoadedView
        paginationWaitingView: @_renderPaginationWaitingView

        refreshable: true
        refreshableViewHeight: 50
        refreshableDistance: 40

        refreshableFetchingView: @_renderRefreshableFetchingView
        refreshableWillRefreshView: @_renderRefreshableWillRefreshView
        refreshableWaitingView: @_renderRefreshableWaitingView

        emptyView: @_renderEmptyView

        renderSeparator: @_renderSeparatorView

        withSections: true
        sectionHeaderView: @_renderSectionHeaderView

        PullToRefreshViewAndroidProps:
          colors: ['#fff']
          progressBackgroundColor: '#003e82'

module.exports = Example
