reduxCrud = require 'redux-crud'
services = require '../services/index'

baseActionCreators = reduxCrud.actionCreatorsFor 'todos'

actionCreators =

  fetch: ->
    optimisticAction = baseActionCreators.fetchStart()
    dispatch optimisticAction

    services.fetch()
    .then (todos) ->
      successAction = baseActionCreators.fetchSuccess todos
      dispatch successAction
      todos
    .catch (ex) ->
      errorAction = baseActionCreators.fetchError ex
      dispatch errorAction
      throw new Error ex

  create: (todo) ->
    optimisticAction = baseActionCreators.createStart todo
    dispatch optimisticAction

    services.create todo
    .then (todo) ->
      successAction = baseActionCreators.createSuccess todo
      dispatch successAction
      todos
    .catch (ex) ->
      errorAction = baseActionCreators.createError todo
      dispatch errorAction
      throw new Error ex

  update: (newTodo) ->
    optimisticAction = baseActionCreators.updateStart newTodo
    dispatch optimisticAction

    service.update newTodo
    .then (todo) ->
      successAction = baseActionCreators.updateSuccess todo
      dispatch successAction
      todos
    .catch (ex) ->
      errorAction = baseActionCreators.updateError newTodo
      dispatch errorAction
      throw new Error ex

  delete: (todoId) ->
    optimisticAction = baseActionCreators.deleteStart todoId
    dispatch optimisticAction

    service.delete newTodo
    .then (todo) ->
      successAction = baseActionCreators.deleteSuccess todo
      dispatch successAction
      todos
    .catch (ex) ->
      errorAction = baseActionCreators.deleteError todos
      dispatch errorAction
      throw new Error ex

module.exports = actionCreators
