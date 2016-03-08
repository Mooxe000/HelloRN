var Component, Render, Screen,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Render = require('./ScreenRender');

Component = require('react').Component;

Screen = (function(superClass) {
  extend(Screen, superClass);

  function Screen() {
    return Screen.__super__.constructor.apply(this, arguments);
  }

  Screen.prototype.render = function() {
    return Render.call(this, this.props, this.state);
  };

  return Screen;

})(Component);

module.exports = Screen;
