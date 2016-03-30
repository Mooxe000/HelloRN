{ assign } = Object
___ = ->
  args = [ {} ]
  for arg in arguments
    args.push arg
  assign.apply @, args

module.exports = ___
