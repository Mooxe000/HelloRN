echo = console.log
dd = require 'ddeyes'
fetch = require 'node-fetch'

resource =
  host: 'localhost'
  port: 3000
  router:
    todos: 'todos'

baseUrl = "http://#{resource.host}:#{resource.port}"
url =
  todos: "#{baseUrl}/#{resource.router.todos}"

checkStatus = (res) ->
  if res.status >= 200 and res.status < 300
    return res
  else
    error = new Error res.statusText
    error.response = res
    throw error

todos =

  fetch: ->
    promise = fetch url.todos
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  create: (todo) ->
    promise = fetch url.todos
    ,
      method: 'POST'
      headers:
        Accept: 'application/json'
        'Content-Type': 'application/json'
      body: JSON.stringify todo
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  update: (newTodo) ->
    promise = fetch "#{url.todos}/#{newTodo.id}"
    ,
      method: 'PATCH'
      headers:
        Accept: 'application/json'
        'Content-Type': 'application/json'
      body: JSON.stringify newTodo
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

  delete: (todoId) ->
    promise = fetch "#{url.todos}/#{todoId}"
    ,
      method: 'DELETE'
    promise.then (res) -> checkStatus res
    .then (res) -> res.json()
    .catch (ex) -> throw new Error ex

module.exports = todos
