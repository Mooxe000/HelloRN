si = require 'seamless-immutable'

init = si

Array =
  push: (siArray, pushData...) ->
    siArray.concat.apply siArray, pushData

  set: (siArray, setIndex, setData) ->
    siArray.flatMap (item, index) ->
      return item unless index is setIndex
      setData

module.exports = {
  init
  Array
}
