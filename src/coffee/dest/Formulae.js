var Component, Formulae, Render,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Render = require('./FormulaeRender');

Component = require('react').Component;

Formulae = (function(superClass) {
  extend(Formulae, superClass);

  function Formulae() {
    return Formulae.__super__.constructor.apply(this, arguments);
  }

  Formulae.prototype.render = function() {
    return Render.call(this, this.props, this.state);
  };

  return Formulae;

})(Component);

module.exports = Formulae;
