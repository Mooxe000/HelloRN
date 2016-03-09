{
  Text
  View
  TouchableHighlight
  TouchableOpacity
} = RN = require 'react-native'

cfx = RN.createFactory

Styl = RN.StyleSheet.create

Comps =
  View: cfx View
  Text: cfx Text
  TouchableHighlight: cfx TouchableHighlight
  TouchableOpacity: cfx TouchableOpacity

exports.cfx = cfx
exports.Styl = Styl
exports.Comps = Comps
