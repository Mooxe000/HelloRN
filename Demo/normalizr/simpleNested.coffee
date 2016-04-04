echo = console.log
dd = require 'ddeyes'

{
  normalize
  Schema
} = require 'normalizr'

# simpleNested
module.exports = ->

  article = new Schema 'articles'
  user = new Schema 'users'

  article.define
    author: user

  input =
    id: 1
    title: 'Some Article'
    author:
      id: 3
      name: 'Mike Persson'

  Object.freeze input

  dd normalize input, article
