echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# mutuallyRecursive
module.exports = ->

  article = new Schema 'articles'
  user = new Schema 'users'
  collection = new Schema 'collections'

  user.define
    articles: arrayOf article

  article.define
    collections: arrayOf collection

  collection.define
    subscribers: arrayOf user

  feedSchema =
    feed: arrayOf article

  input =
    feed: [
      id: 1
      title: 'Some Article'
      collections: [
          id: 1
          title: 'Awesome Writing'
          subscribers: [
              id: 4
              name: 'Andy Warhol'
              articles: [
                id: 1
                title: 'Some Article'
              ]
            ,
              id: 100
              name: 'T.S. Eliot'
              articles: [
                id: 1
                title: 'Some Article'
              ]
          ]
        ,
          id: 7
          title: 'Even Awesomer'
          subscribers: [
            id: 100
            name: 'T.S. Eliot'
            articles: [
              id: 1
              title: 'Some Article'
            ]
          ]
      ]
    ]

  dd normalize input, feedSchema
