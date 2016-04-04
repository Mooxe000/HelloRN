echo = console.log
dd = require 'ddeyes'

isObject = require 'lodash/isObject'
isEqual = require 'lodash/isEqual'
merge = require 'lodash/merge'

{
  normalize
  Schema
  valuesOf
} = require 'normalizr'

# mergeFunc
module.exports = ->
  author = new Schema 'authors'

  input =
    author:
      id: 1
      name: 'Ada Lovelace'
      contact:
        phone: '555-0100'
    reviewer:
      id: 1
      name: 'Ada Lovelace'
      contact:
        email: 'ada@lovelace.com'

  Object.freeze input

  options =

    mergeIntoEntity: (
      entityA
      entityB
      entityKey
    ) ->

      for key, value of entityB

        continue unless entityB.hasOwnProperty key

        if (not entityA.hasOwnProperty key) or
        (isEqual entityA[key], entityB[key])
          entityA[key] = entityB[key]
          continue

        if (isObject  entityA[key]) and
        (isObject entityB[key])
          merge entityA[key], entityB[key]
          continue

        console.warn 'Unequal data!'

  dd normalize input
  ,
    valuesOf author
  , options
