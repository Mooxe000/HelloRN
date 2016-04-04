echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
  valuesOf
} = require 'normalizr'

# nestedMap
module.exports = ->

  article = new Schema 'articles'
  user = new Schema 'users'

  article.define
    collaborators: valuesOf arrayOf user

  feedSchema =
    feed: arrayOf article
    suggestions: valuesOf arrayOf article

  input =
    feed: [
        id: 1
        title: 'Some Article'
        collaborators:
          authors: [
            id: 3,
            name: 'Mike Persson'
          ]
          reviewers: [
            id: 2
            name: 'Pete Hunt'
          ]
      ,
        id: 2
        title: 'Other Article'
        collaborators:
          authors: [
            id: 2
            name: 'Pete Hunt'
          ]
      ,
        id: 3,
        title: 'Last Article'
    ]

    suggestions:
      1: [
          id: 2
          title: 'Other Article'
          collaborators:
            authors: [
              id: 2
              name: 'Pete Hunt'
            ]
        ,
          id: 3,
          title: 'Last Article'
      ]

  Object.freeze input

  dd normalize input, feedSchema
