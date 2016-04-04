echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# simple
module.exports = ->
  article = new Schema 'articles'

  input =
    id: 1
    title: 'Some Article'
    isFavorite: false

  Object.freeze input

  dd getIdAttribute: article.getIdAttribute()
  dd getKey: article.getKey()

  dd normalize input, article
