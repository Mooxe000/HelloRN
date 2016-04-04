echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# attributeArray
module.exports = ->

  article = new Schema 'articles'
  tutorial = new Schema 'tutorials'

  articleOrTutorial =
    articles: article
    tutorials: tutorial

  input = [
      id: 1
      type: 'articles'
      title: 'Some Article'
    ,
      id: 1
      type: 'tutorials'
      title: 'Some Tutorial'
  ]

  Object.freeze input

  dd normalize input
  ,
    arrayOf articleOrTutorial
    , schemaAttribute: 'type'
