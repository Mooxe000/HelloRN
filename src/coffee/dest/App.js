var RN, Render;

Render = require('./AppRender');

RN = require('react-native');

module.exports = RN.createClass({
  render: function() {
    return Render.call(this, this.props, this.state);
  }
});
