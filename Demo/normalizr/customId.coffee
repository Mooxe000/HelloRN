echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# customId
module.exports = ->
  article = new Schema 'articles'
  , idAttribute: 'slug'

  input =
    id: 1
    slug: 'some-article'
    title: 'Some Article'
    isFavorite: false

  Object.freeze input

  dd getIdAttribute: article.getIdAttribute()
  dd getKey: article.getKey()

  dd normalize input, article
