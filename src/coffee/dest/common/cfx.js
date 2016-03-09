var Comps, RN, Styl, Text, TouchableHighlight, TouchableOpacity, View, cfx, ref;

ref = RN = require('react-native'), Text = ref.Text, View = ref.View, TouchableHighlight = ref.TouchableHighlight, TouchableOpacity = ref.TouchableOpacity;

cfx = RN.createFactory;

Styl = RN.StyleSheet.create;

Comps = {
  View: cfx(View),
  Text: cfx(Text),
  TouchableHighlight: cfx(TouchableHighlight),
  TouchableOpacity: cfx(TouchableOpacity)
};

exports.cfx = cfx;

exports.Styl = Styl;

exports.Comps = Comps;
