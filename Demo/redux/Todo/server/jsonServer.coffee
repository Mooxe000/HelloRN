#!/usr/bin/env coffee
jsonServer = require 'json-server'
server = jsonServer.create()

server.use jsonServer.defaults()

router = jsonServer.router 'todos.json'

server.use '/', router
server.listen 3000
