# echo = console.log
runSequence = require 'run-sequence'

module.exports = ->

  # echo 'Hello World!!!'

  runSequence 'coffee', 'watch'
