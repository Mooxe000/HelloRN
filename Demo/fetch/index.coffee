#!/usr/bin/env coffee
echo = console.log
dd = require 'ddeyes'
fetch = require 'node-fetch'
qsUrl = require '../../src/common/qsUrl'

{
  normalize
  Schema
  arrayOf
  unionOf
  valuesOf
} = require 'normalizr'

key = ''

api =

  ###
  * page
    * Number
    * 页数
  * tab
    * String
    * 主题分类
    * ask share job good
  * limit
    * Number
    * 每一页的主题数量
  * mdrender
    * String
    * 当为 false 时，不渲染。默认为 true
    * 渲染出现的所有 markdown 格式文本。
  ###
  topics:
    method: 'get'
    url: 'http://cnodejs.org/api/v1/topics'

  # topic:
  #   method: 'get'
  #   url: "http://cnodejs.org/api/v1/topic/#{topic_id}"

fetch qsUrl api.topics.url
,
  page: 1
  limit: 15
  mdrender: 'false'
.then (res) -> res.json()
.then (json) ->

  Stopics = new Schema 'topics'

  handleAuthor = normalize json.data
  ,
    valuesOf Stopics
  , assignEntity: (obj, key, val, originalInput) ->
    return if key is 'content'
    return if key is 'author_id'
    if key is 'author'
      obj[key] = Object.assign {}
      , val
      , id: originalInput.author_id
      return
    obj[key] = val

  Susers = new Schema 'users'
  Stopics.define
    author: Susers

  # dd handleAuthor.entities.topics
  dd normalize handleAuthor.entities.topics
  ,
    valuesOf
      share: Stopics
      ask: Stopics
      job: Stopics
    , schemaAttribute: 'tab'
