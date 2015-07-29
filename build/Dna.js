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

    Dna.letters = ['A', 'C', 'G', 'T'];

    Dna.complement_map = {
      A: 'T',
      C: 'G',
      G: 'C',
      T: 'A'
    };

    Dna.prototype.locateOriC = function() {
      return console.log('unimplemented');
    };

    Dna.prototype.complement = function() {
      var end, i, j, letter, map, ref, result;
      map = this.constructor.complement_map;
      result = '';
      end = this.sequence.length - 1;
      for (i = j = ref = end; ref <= 0 ? j <= 0 : j >= 0; i = ref <= 0 ? ++j : --j) {
        letter = this.sequence[i];
        result += map[letter];
      }
      return result;
    };

    Dna.prototype.DnaABox = function() {};

    return Dna;

  })(Sequence);

  module.exports = Dna;

}).call(this);
