echo = console.log
gulp = require 'gulp'

module.exports = ->

  gulp.watch 'src/**/*', echo 'Hello Wolrd!!!'
