echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# customIdFunc
module.exports = ->

  makeSlug = (article) ->
    posted = article.posted
    title = article.title
    .toLowerCase().replace ' ', '-'

    [
      title
      posted.year
      posted.month
      posted.day
    ].join '-'

  article = new Schema 'articles'
  , idAttribute: makeSlug

  input =
    id: 1
    title: 'Some Article'
    isFavorite: false
    posted:
      day: 12
      month: 3
      year: 1983

  Object.freeze input

  dd normalize input, article
