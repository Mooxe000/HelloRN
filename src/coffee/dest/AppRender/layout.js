var Text, View, ref;

ref = require('../common/cfx-components'), Text = ref.Text, View = ref.View;

module.exports = function(styles, funcs) {
  return View({
    style: styles.container
  }, Text({
    style: styles.welcome
  }, 'Welcome to React Native!'), Text({
    style: styles.instructions
  }, 'To get started, edit index.ios.js'), funcs.notice());
};
