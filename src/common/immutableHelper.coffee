SI = require 'seamless-immutable'

module.exports =
  init: SI

  Array:
    push: (siArray, pushData...) ->
      siArray.concat.apply siArray, pushData

    set: (siArray, setIndex, setData) ->
      siArray.flatMap (item, index) ->
        return item unless index is setIndex
        setData

    remove: (siArray, setIndex) ->
      if typeof setIndex is 'number'
        siArray.flatMap (item, index) ->
          return item unless index is setIndex
          []
      else if typeof setIndex is 'object'
        siArray.flatMap (item, index) ->
          for k, v of setIndex
            return item unless item[k] is v
          []
      else siArray # TODO array

    eachAsMutable: (siArray, siObjectHandler) ->
      r = []
      for siObject in siArray
        siObject = siObjectHandler siObject if siObjectHandler
        r.push siObject.asMutable()
      r
