gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
babel = require 'gulp-babel'

module.exports = ->

  gulp.src './src/**/*.coffee'
  .pipe (
    coffee bare: true
  ).on 'error', gutil.log
  .pipe gulp.dest './dest'

  gulp.src './src/Apps/**/*.js'
  .pipe babel
    babelrc: false
    presets: [
      'es2015'
      'stage-0'
      'stage-2'
      'react'
    ]
  .pipe gulp.dest './dest/Apps'

  gulp.src './src/**/images/**/*'
  .pipe gulp.dest './dest'
