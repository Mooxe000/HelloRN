echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# constructNewObject
module.exports = ->

  writer = new Schema 'writers'
  schema = writer

  input =
    id: 'constructor'
    name: 'Constructor'
    isAwesome: true

  dd normalize input, schema
