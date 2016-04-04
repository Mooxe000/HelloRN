echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# deleteFunc
module.exports = ->

  article = new Schema 'articles'
  type = new Schema 'types'

  article.define
    type: type

  input =
    id: 1
    title: 'Some Article'
    isFavorite: false
    typeId: 1
    type:
      id: 1

  Object.freeze input

  options =
    assignEntity: (obj, key, val) ->
      return if key is 'typeId'
      obj[key] = val

  dd normalize input, article, options
