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
      var letter, map;
      map = this.constructor.complement_map;
      return ((function() {
        var i, len, ref, results;
        ref = this.sequence;
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          letter = ref[i];
          results.push(map[letter]);
        }
        return results;
      }).call(this)).join('');
    };

    return Dna;

  })(Sequence);

  module.exports = Dna;

}).call(this);
