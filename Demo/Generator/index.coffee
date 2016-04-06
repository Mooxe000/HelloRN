#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
co = require 'co'

delay = (ms) ->
  new Promise (resolve) ->
    setTimeout resolve, ms

# helloWorldGenerator = ->
#   yield co delay 1000
#   .then -> echo 'hello'
#   yield co delay 1000
#   .then -> echo 'world'
#   yield co delay 1000
#   .then -> echo 'ending'

helloWorldGenerator = ->
  yield delay 1000
  echo 'hello'
  yield delay 1000
  echo 'world'
  yield delay 1000
  echo 'ending'

co helloWorldGenerator()
