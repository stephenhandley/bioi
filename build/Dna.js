(function() {
  var Dna, Sequence,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Sequence = require('./Sequence');

  Dna = (function(superClass) {
    extend(Dna, superClass);

    function Dna() {
      return Dna.__super__.constructor.apply(this, arguments);
    }

    Dna.alphabet = ['A', 'C', 'T', 'G'];

    Dna.prototype.locateOriC = function() {
      return console.log('unimplemented');
    };

    return Dna;

  })(Sequence);

  module.exports = Dna;

}).call(this);
