gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
babel = require 'gulp-babel'

module.exports = ->

  gulp.src './src/**/*.coffee'
  .pipe coffee bare: true
  # .on 'error', gutil.log
  .pipe gulp.dest './dest'

  gulp.src './src/libs/react-redux/**/*.js'
  .pipe babel presets: [
    'es2015'
    'stage-2'
  ]
  .pipe gulp.dest './dest/libs/react-redux'
