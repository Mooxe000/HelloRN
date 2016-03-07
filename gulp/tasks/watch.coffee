gulp = require 'gulp'

module.exports = ->

  gulp.watch 'src/**/*', [ 'coffee' ]
