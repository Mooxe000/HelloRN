echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# merge
module.exports = ->

  writer = new Schema 'writers'
  book = new Schema 'books'
  schema = arrayOf writer

  writer.define
    books: arrayOf book

  input = [
      id: 3
      name: 'Jo Rowling'
      isBritish: true
      location:
        x: 100
        y: 200
        nested: [
          'hello'
          world: true
        ]
      books: [
        id: 1
        soldWell: true
        name: 'Harry Potter'
      ]
    ,
      id: 3
      name: 'Jo Rowling'
      bio: 'writer'
      location:
        x: 100
        y: 200
        nested: [
          'hello'
          world: true
        ]
      books: [
        id: 1
        isAwesome: true
        name: 'Harry Potter'
      ]
  ]

  dd normalize input, schema
