var RN, Text, TouchableHighlight, TouchableOpacity, View, cfxify, defaultComponents, ref;

ref = RN = require('react-native'), Text = ref.Text, View = ref.View, TouchableHighlight = ref.TouchableHighlight, TouchableOpacity = ref.TouchableOpacity;

cfxify = function(compName) {
  return RN.createFactory(compName);
};

defaultComponents = {
  View: cfxify(View),
  Text: cfxify(Text),
  TouchableHighlight: cfxify(TouchableHighlight),
  TouchableOpacity: cfxify(TouchableOpacity)
};

exports.cfxIfy = cfxify;

exports.cfxComps = defaultComponents;
