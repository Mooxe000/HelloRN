var Component, Screen,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Component = require('react').Component;

Screen = (function(superClass) {
  extend(Screen, superClass);

  function Screen() {
    return Screen.__super__.constructor.apply(this, arguments);
  }

  return Screen;

})(Component);

module.exports = Screen;