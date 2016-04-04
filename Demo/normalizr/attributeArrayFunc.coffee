echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# attributeArrayFunc
module.exports = ->

  guessSchema = (item) ->
    "#{item.type}s"

  article = new Schema 'articles'
  tutorial = new Schema 'tutorials'

  articleOrTutorial =
    articles: article
    tutorials: tutorial

  input = [
      id: 1
      type: 'article'
      title: 'Some Article'
    ,
      id: 1
      type: 'tutorial'
      title: 'Some Tutorial'
  ]

  Object.freeze input

  dd normalize input
  ,
    arrayOf articleOrTutorial
    , schemaAttribute: guessSchema
