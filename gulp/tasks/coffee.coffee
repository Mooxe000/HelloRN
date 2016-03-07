gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'

module.exports = ->

  gulp.src './src/coffee/src/**/*'
  .pipe (
    coffee bare: true
  ).on 'error', gutil.log
  .pipe gulp.dest './src/coffee/dest/'
