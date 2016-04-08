#!/usr/bin/env coffee
{
  create
  defaults
  router
} = require 'json-server'

server = create()

server.use defaults()
server.use '/'
, router 'todos.json'

server.listen 3000
