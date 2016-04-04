echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
  arrayOf
  valuesOf
  unionOf
} = require 'normalizr'

# union
module.exports = ->

  user = new Schema 'users'
  group = new Schema 'groups'
  member = unionOf
    users: user
    groups: group
  ,
    schemaAttribute: 'type'

  group.define
    members: arrayOf member
    owner: member
    relations: valuesOf member

  input =
    group:
      id: 1
      name: 'facebook'
      members: [
          id: 2
          type: 'groups'
          name: 'react'
        ,
          id: 3
          type: 'users'
          name: 'Huey'
      ]
      owner:
        id: 4
        type: 'users'
        name: 'Jason'
      relations:
        friend:
          id: 5
          type: 'users'
          name: 'Nate'

  Object.freeze input

  dd normalize input
  , group: group
