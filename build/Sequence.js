(function() {
  var Sequence,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Sequence = (function() {
    function Sequence(args) {
      if ('sequence' in args) {
        this.sequence = args.sequence.trim().toUpperCase();
      }
      this.meta = 'meta' in args ? args.meta : {};
    }

    Sequence.prototype.count = function(mer) {
      var count, i, j, merlen, ref, seqlen, subseq;
      count = 0;
      seqlen = this.sequence.length;
      merlen = mer.length;
      for (i = j = 0, ref = seqlen - merlen; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        subseq = this.sequence.slice(i, +(i + merlen - 1) + 1 || 9e9);
        if (subseq === mer) {
          count++;
        }
      }
      return count;
    };

    Sequence.prototype.counts = function() {
      var alphabet, base, j, l, len, len1, ref, result;
      alphabet = this.constructor.alphabet;
      result = {};
      for (j = 0, len = alphabet.length; j < len; j++) {
        base = alphabet[j];
        result[base] = 0;
      }
      ref = this.sequence;
      for (l = 0, len1 = ref.length; l < len1; l++) {
        base = ref[l];
        if ((indexOf.call(alphabet, base) >= 0)) {
          result[base] += 1;
        } else {
          throw new Error("DNA: Invalid base: " + base);
        }
      }
      return result;
    };

    Sequence.prototype.kMers = function(k) {
      var count, counts, current_max, i, j, l, len, max, mer, pair, ref, results, seqlen;
      counts = {};
      seqlen = this.sequence.length;
      for (i = j = 0, ref = seqlen - k; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        mer = this.sequence.slice(i, +(i + k - 1) + 1 || 9e9);
        if (!(mer in counts)) {
          counts[mer] = 0;
        }
        counts[mer] += 1;
      }
      max = [
        {
          count: 0
        }
      ];
      for (mer in counts) {
        count = counts[mer];
        current_max = max[0].count;
        pair = {
          mer: mer,
          count: count
        };
        if (count > current_max) {
          max = [pair];
        } else if (count === current_max) {
          max.push(pair);
        }
      }
      results = [];
      for (l = 0, len = max.length; l < len; l++) {
        pair = max[l];
        results.push(pair.mer);
      }
      return results;
    };

    return Sequence;

  })();

  module.exports = Sequence;

}).call(this);
