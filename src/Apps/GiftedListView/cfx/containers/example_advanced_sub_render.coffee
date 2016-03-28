{
  cfxify
  Comps
  Platform
} = require '../../../../common/cfx'
{
  Text
  View
  TouchableHighlight
} = Comps

GiftedSpinner = cfxify require 'react-native-gifted-spinner'

{
  customStyles
} = require './example_advanced_style'

paginationFetchigView = ->
  View style: customStyles.paginationView
  ,
    GiftedSpinner()

paginationAllLoadedView = ->
  View style: customStyles.paginationView
  ,
    Text style: customStyles.actionsLabel
    , '~'

paginationWaitingView = (
  paginateCallback
) ->
  TouchableHighlight
    underlayColor: '#c8c7cc'
    onPress: paginateCallback
    style: customStyles.paginationView
  ,
    Text style: [
      customStyles.actionsLabel
      fontSize: 13
    ], 'Load more'

refreshableFetchingView = ->
  View style: customStyles.refreshableView
  ,
    GiftedSpinner()

refreshableWillRefreshView = ->
  View style: customStyles.refreshableView
  ,
    Text style: customStyles.actionsLabel
    , '↻'

refreshableWaitingView = (
  refreshCallback
) ->
  if Platform.OS isnt 'android'
    View style: customStyles.refreshableView
    ,
      Text style: customStyles.actionsLabel
      , '↓'
  else
    TouchableHighlight
      style: customStyles.refreshableView
      underlayColor: '#c8c7cc'
      onPress: refreshCallback
    ,
      Text style: customStyles.actionsLabel
      , '↻'

emptyView = (refreshCallback) ->
  View style: customStyles.defaultView
  ,
    Text style: customStyles.defaultViewTitle
    , 'Sorry, there is no content to display'
  ,
    TouchableHighlight
      underlayColor: '#c8c7cc'
      onPress: refreshCallback
    ,
      Text {}
      , '↻'

separatorView = ->
  View style: customStyles.separator

sectionHeaderView = (
  sectionData
  sectionID
) ->
  View style: customStyles.header
  ,
    Text style: customStyles.headerTitle
    , sectionID

module.exports = {
  sectionHeaderView

  paginationFetchigView
  paginationAllLoadedView
  paginationWaitingView

  refreshableFetchingView
  refreshableWillRefreshView
  refreshableWaitingView

  emptyView
  separatorView
}
