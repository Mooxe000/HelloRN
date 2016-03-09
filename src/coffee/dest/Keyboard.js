var Component, Keyboard, Render,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Render = require('./KeyboardRender');

Component = require('react').Component;

Keyboard = (function(superClass) {
  extend(Keyboard, superClass);

  function Keyboard() {
    return Keyboard.__super__.constructor.apply(this, arguments);
  }

  Keyboard.prototype.render = function() {
    return Render.call(this, this.props, this.state);
  };

  return Keyboard;

})(Component);

module.exports = Keyboard;
