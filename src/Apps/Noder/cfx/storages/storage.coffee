Storage = (
  require 'react-native-storage'
).default

storage = new Storage

  # 最大容量，默认值1000条数据循环存储
  size: 1000

  # 数据过期时间，默认一整天（1000 * 3600 * 24秒）
  defaultExpires: 1000 * 3600 * 2

  # 读写时在内存中缓存数据。默认启用。
  enableCache: true

  # 如果storage中没有相应数据，或数据已过期，
  # 则会调用相应的sync同步方法，无缝返回最新数据。
  sync:

    topics: (params) ->
      {
        resolve
        reject
      } = params

      fetch 'http://cnodejs.org/api/v1/topics'
      ,
        method: 'GET'
      .then (res) -> res.json()
      .then (json) ->

        if json and json.data
          storage.save
            key: 'topics'
            rawData: json.data
          resolve and resolve json.data
        else
          reject and reject 'fetch topics error'

      .catch (err) ->
        console.warn err
        reject and reject err

module.exports = storage
