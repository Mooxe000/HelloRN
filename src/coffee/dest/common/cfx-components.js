var Text, TouchableHighlight, TouchableOpacity, View, cfxify, ref;

ref = require('react-native'), Text = ref.Text, View = ref.View, TouchableHighlight = ref.TouchableHighlight, TouchableOpacity = ref.TouchableOpacity;

cfxify = require('./cfx').cfxify;

module.exports = {
  View: cfxify(View),
  Text: cfxify(Text),
  TouchableHighlight: cfxify(TouchableHighlight),
  TouchableOpacity: cfxify(TouchableOpacity)
};
