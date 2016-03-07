var RN, Text, View, ref;

ref = RN = require('react-native'), Text = ref.Text, View = ref.View;

module.exports = {
  View: RN.createFactory(View),
  Text: RN.createFactory(Text)
};
