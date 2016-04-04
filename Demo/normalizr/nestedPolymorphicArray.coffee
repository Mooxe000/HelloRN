echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

# nestedPolymorphicArray
module.exports = ->

  article = new Schema 'articles'
  tutorial = new Schema 'tutorials'
  articleOrTutorial =
    articles: article
    tutorials: tutorial
  user = new Schema 'users'
  collection = new Schema 'collections'

  article.define
    author: user
    collections: arrayOf collection

  tutorial.define
    author: user
    collections: arrayOf collection

  collection.define
    curator: user

  feedSchema =
    feed: arrayOf articleOrTutorial
    , schemaAttribute: 'type'

  input =
    feed: [
        id: 1
        type: 'articles'
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
        id: 1
        type: 'tutorials'
        title: 'Some Tutorial'
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
