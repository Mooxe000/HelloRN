echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  valuesOf
} = require 'normalizr'

# simpleMap
module.exports = ->

  article = new Schema 'articles'

  input =

    one:
      id: 1
      title: 'Some Article'

    two:
      id: 2
      title: 'Other Article'

  Object.freeze input

  dd normalize input
  , valuesOf article
