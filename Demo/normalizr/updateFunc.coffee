echo = console.log
dd = require 'ddeyes'

map = require 'lodash/map'
merge = require 'lodash/merge'

{
  normalize
  Schema
} = require 'normalizr'

# updateFunc
module.exports = ->
  article = new Schema 'articles'
  author = new Schema 'authors'

  article.define
    author: author

  input =
    id: '123'
    title: 'My article'
    author:
      id: '321'
      screenName: 'paul'
    media: [
      id: '1345'
      url: 'https://bit.ly/...'
    ]

  options =
    assignEntity: (obj, key, val, originalInput) ->
      if key is 'media'
        screenName = originalInput.author.screenName
        val = map val
        , (media, i) ->
          merge {}, media
          , mediaViewUrl: "/#{screenName}/articles/#{obj.id}/photos/#{i}"
      obj[key] = val

  dd normalize input, article, options
