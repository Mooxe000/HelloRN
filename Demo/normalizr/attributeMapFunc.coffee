echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  valuesOf
} = require 'normalizr'

# attributeMapFunc
module.exports = ->

  guessSchema = (item) ->
    "#{item.type}s"

  article = new Schema 'articles'
  tutorial = new Schema 'tutorials'
  articleOrTutorial =
    articles: article
    tutorials: tutorial

  input =
    one:
      id: 1
      type: 'article'
      title: 'Some Article'
    two:
      id: 2
      type: 'article'
      title: 'Another Article'
    three:
      id: 1
      type: 'tutorial'
      title: 'Some Tutorial'

  Object.freeze input

  dd normalize input
  ,
    valuesOf articleOrTutorial
    , schemaAttribute: guessSchema
