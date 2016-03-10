#!/usr/bin/env coffee
{
  log
  error
} = console
echo = log
require 'shelljs/make'
dd = require 'ddeyes'
km = require './keyMirror'

target.all = ->

  for target in [
    'hello'
    123
    null
    true
    [
      'hello'
      'world'
    ]
    [
      'hello'
      123
      null
    ]
    {
      'hello': 123
      'world': false
    }
  ]
    try
      echo ' > before:'
      dd target
      echo ' > after:'
      dd km target
    catch e
      error e

    echo ''
    echo ' ----------- '
    echo ''
