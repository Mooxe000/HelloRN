queryString = require 'query-string'
qsUrl = (url, params) ->
  "#{url}?#{queryString.stringify params}"

module.exports = qsUrl
