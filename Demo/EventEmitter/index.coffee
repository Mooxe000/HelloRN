#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'

EventEmitter = require 'eventemitter3'
EE = new EventEmitter()

context = foo: 'bar'

emitted = ->
  echo @ is context

EE.once 'event-name'
, emitted, context

EE.on 'another-event'
, emitted, context

echo EE.listeners 'event-name'
, true

EE.removeListener 'another-event'
, emitted, context

echo EE.listeners 'another-event'
, true

# EE.emit 'event-name'
EE.emit 'another-event'
