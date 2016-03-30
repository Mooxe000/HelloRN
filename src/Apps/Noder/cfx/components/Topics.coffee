{
  Comps
  Styl
  cfx
} = require '../../../../common/cfx'

{
  View
  Text
} = Comps

styles = Styl
  root:
    flex: 1
    alignItems: 'center'
    justifyContent: 'center'

module.exports = cfx ->
  {
    topics
  } = @props

  topic = topics[0]

  View style: styles.root
  ,
    Text {}
    , 'id: 56f364c7532839c33a99d17e'
    # , "id: #{topic.id}"
  ,
    Text {}
    , 'author_id: 504c28a2e2b845157708cb61'
    # , "author_id: #{topic.author_id}"
  ,
    Text {}
    , 'tab: share'
    # , "tab: #{topic.tab}"
  ,
    Text {}
    , 'top: true'
    # , "top: #{topic.top}"
  ,
    Text {}
    , 'title: 【深圳】NodeParty at 腾讯大厦 2016.04.09'
    # , "title: #{topic.title}"
