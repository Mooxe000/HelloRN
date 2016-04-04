echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# simpleArray
module.exports = ->

  article = new Schema 'articles'

  input = [
      id: 1
      title: 'Some Article'
    ,
      id: 2
      title: 'Other Article'
  ]

  Object.freeze input

  dd normalize input
  , arrayOf article
