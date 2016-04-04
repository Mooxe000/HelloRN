echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
  valuesOf
} = require 'normalizr'

# nestedPolymorphicMap
module.exports = ->

  article = new Schema 'articles'
  user = new Schema 'users'
  group = new Schema 'groups'
  userOrGroup =
    users: user
    groups: group

  article.define
    collaborators: valuesOf userOrGroup
    , schemaAttribute: 'type'

  feedSchema =
    feed: arrayOf article
    suggestions: valuesOf arrayOf article

  input =
    feed: [
        id: 1
        title: 'Some Article'
        collaborators:
          author:
            id: 3
            type: 'users'
            name: 'Mike Persson'
          reviewer:
            id: 2
            type: 'groups'
            name: 'Reviewer Group'
      ,
        id: 2
        title: 'Other Article'
        collaborators:
          author:
            id: 2
            type: 'users'
            name: 'Pete Hunt'
      ,
        id: 3
        title: 'Last Article'
    ]

    suggestions:
      1: [
          id: 2
          title: 'Other Article'
        ,
          id: 3
          title: 'Last Article'
      ]

  Object.freeze input

  dd normalize input, feedSchema
