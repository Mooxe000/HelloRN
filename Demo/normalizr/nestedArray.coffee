echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# nestedArray
module.exports = ->

  article = new Schema 'articles'
  user = new Schema 'users'
  collection = new Schema 'collections'

  article.define
    author: user
    collections: arrayOf collection

  collection.define
    curator: user

  feedSchema =
    feed: arrayOf article

  input =
    feed: [
        id: 1
        title: 'Some Article'
        author:
          id: 3
          name: 'Mike Persson'
        collections: [
            id: 1
            title: 'Awesome Writing'
            curator:
              id: 4
              name: 'Andy Warhol'
          ,
            id: 7
            title: 'Even Awesomer'
            curator:
              id: 100
              name: 'T.S. Eliot'
        ]
      ,
        id: 2
        title: 'Other Article'
        collections: [
          id: 2
          title: 'Neverhood'
          curator:
            id: 120
            name: 'Ada Lovelace'
        ]
        author:
          id: 2
          name: 'Pete Hunt'
    ]

  Object.freeze input

  dd normalize input, feedSchema
