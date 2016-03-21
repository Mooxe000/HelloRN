_ =
  isString: require 'lodash.isstring'
  isArray: require 'lodash.isarray'

module.exports = (keys) ->

  r = {}

  errMsg = [
    'keyMirror(...): Argument must be'
    'an String or String Array.'
  ].join ' '

  if _.isString keys
    r[keys] = keys
  else if  _.isArray keys

    for key in keys
      if _.isString key
        r[key] = key
      else throw new Error errMsg

  else
    throw new Error errMsg

  r
