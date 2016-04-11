#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
co = require 'co'
cuid = require 'cuid'

{
  normalizerFetch
  deleteAll
  toggleState
} = require './helper'

services =
  todoApp: require '../../Client/services/index'

co do ->
  yield deleteAll()

  yield services.todoApp.Todo.create
    id: cuid()
    text: "Learn about actions"
    completed: false

  yield services.todoApp.Todo.create
    id: cuid()
    text: "Learn about reducers"
    completed: false

  yield services.todoApp.Todo.create
    id: cuid()
    text: "Learn about store"
    completed: false

  yield toggleState 1

  yield normalizerFetch()
  .then (normalizer) -> dd normalizer

  # yield deleteAll()
