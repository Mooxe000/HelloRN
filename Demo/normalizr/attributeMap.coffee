echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  valuesOf
} = require 'normalizr'

# attributeMap
module.exports = ->

  article = new Schema 'articles'
  tutorial = new Schema 'tutorials'
  articleOrTutorial =
    articles: article
    tutorials: tutorial

  input =
    one:
      id: 1
      type: 'articles'
      title: 'Some Article'
    two:
      id: 2
      type: 'articles'
      title: 'Another Article'
    three:
      id: 1
      type: 'tutorials'
      title: 'Some Tutorial'

  Object.freeze input

  dd normalize input
  ,
    valuesOf articleOrTutorial
    , schemaAttribute: 'type'
