#!/usr/bin/env coffee
dd = require 'ddeyes'
fetch = require 'node-fetch'
qsUrl = require '../../src/common/qsUrl'

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
  limit: 1
  mdrender: 'false'
.then (res) -> res.json()
.then (json) -> dd json
