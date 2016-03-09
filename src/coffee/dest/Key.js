var Component, Key, Render,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Render = require('./KeyRender');

Component = require('react').Component;

Key = (function(superClass) {
  extend(Key, superClass);

  function Key() {
    return Key.__super__.constructor.apply(this, arguments);
  }

  Key.prototype.render = function() {
    return Render.call(this, this.props, this.state);
  };

  return Key;

})(Component);

module.exports = Key;
