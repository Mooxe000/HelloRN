echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# selfRecursive
module.exports = ->

  user = new Schema 'users'

  user.define
    parent: user

    input =
      id: 1
      name: 'Andy Warhol'
      parent:
        id: 7
        name: 'Tom Dale'
        parent:
          id: 4
          name: 'Pete Hunt'

    Object.freeze input

    dd normalize input, user
