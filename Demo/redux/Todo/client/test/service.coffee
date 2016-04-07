#!/usr/bin/env coffee
{ assign } = Object
echo = console.log
dd = require 'ddeyes'
co = require 'co'
cuid = require 'cuid'
todosService = require '../services/index'
{
  normalize
  Schema
  arrayOf
} = require 'normalizr'

list = ->
  todosService.fetch()
  .then (json) -> dd json

normalizerData = ->
  todosService.fetch()
  .then (json) ->
    normalizer = normalize json
    , arrayOf todosSchema

toggleState = (index) ->
  normalizerData()
  .then (normalizer) ->
    ids = normalizer.result
    id = ids[index]
    todo = normalizer.entities.todos[id]
    do -> assign {}, todo
    , completed: if todo.done then false else true
  .then (newTodo) ->
    todosService.update newTodo

deleteAll = ->
  normalizerData()
  .then (normalizer) ->
    ids = normalizer.result
    for id in ids
      todosService.delete {
        id
      }

todosSchema = new Schema 'todos'

co do ->
  yield deleteAll()
  yield todosService.create
    id: cuid()
    text: "Learn about actions"
    completed: false
  yield todosService.create
    id: cuid()
    text: "Learn about reducers"
    completed: false
  yield todosService.create
    id: cuid()
    text: "Learn about store"
    completed: false

  yield toggleState 1

  yield normalizerData()
  .then (normalizer) -> dd normalizer

  # yield deleteAll()
