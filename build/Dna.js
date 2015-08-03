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
      throw new Error('unimplemented');
    };

    Dna.prototype.locateTerC = function() {
      throw new Error('unimplemented');
    };

    Dna.prototype.minimumSkew = function() {
      var i, indexes, j, min, ref, skew, skews;
      skews = this.skews();
      min = Infinity;
      indexes = [];
      for (i = j = 1, ref = skews.length; 1 <= ref ? j < ref : j > ref; i = 1 <= ref ? ++j : --j) {
        skew = skews[i];
        if (skew < min) {
          min = skew;
          indexes = [i];
        } else if (skew === min) {
          indexes.push(i);
        }
      }
      return indexes;
    };

    Dna.prototype.skews = function() {
      var delta, i, j, previous, ref, result, skew;
      result = [0];
      for (i = j = 0, ref = this.sequence.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
        previous = this.sequence[i];
        delta = (function() {
          switch (previous) {
            case 'C':
              return -1;
            case 'G':
              return +1;
            default:
              return 0;
          }
        })();
        skew = result[i] + delta;
        result.push(skew);
      }
      return result;
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
