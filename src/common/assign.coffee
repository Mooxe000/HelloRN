{ assign } = Object
___ = ->
  # first param's type mast be 'object'
  if arguments[0] and typeof arguments[0] isnt 'object'
    throw new Error 'First of params must be an \'object\'.'

  args = [ {} ]

  unless arguments[0] instanceof Array
    for arg in arguments
      args.push arg
    return assign.apply @, args

  else unless arguments[1]
    ___.apply @, arguments[0]

  else
    r = arguments[0].slice()
    for n, arg of arguments
      continue if n is '0'
      if arg instanceof Array
        for item in arg
          r.push item
      else
        r.push arg
    return r

module.exports = ___
