(function() {
  var Extend, Sequence,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Extend = require('extend');

  Sequence = (function() {
    function Sequence(args) {
      if ('sequence' in args) {
        this.sequence = args.sequence.replace(/\s+/g, '').toUpperCase();
      }
      this.meta = 'meta' in args ? args.meta : {};
    }

    Sequence.prototype.letterCounts = function() {
      var j, l, len, len1, letter, letters, ref, result;
      letters = this.constructor.letters;
      result = {};
      for (j = 0, len = letters.length; j < len; j++) {
        letter = letters[j];
        result[letter] = 0;
      }
      ref = this.sequence;
      for (l = 0, len1 = ref.length; l < len1; l++) {
        letter = ref[l];
        if ((indexOf.call(letters, letter) >= 0)) {
          result[letter] += 1;
        } else {
          throw new Error(this.constructor.name + ": invalid letter `" + letter + "`");
        }
      }
      return result;
    };

    Sequence.prototype.merCount = function(mer) {
      var count, end, j, last_start, mer_length, ref, seq_length, start, subseq;
      count = 0;
      seq_length = this.sequence.length;
      mer_length = mer.length;
      last_start = seq_length - mer_length;
      for (start = j = 0, ref = last_start; 0 <= ref ? j <= ref : j >= ref; start = 0 <= ref ? ++j : --j) {
        end = start + mer_length - 1;
        subseq = this.sequence.slice(start, +end + 1 || 9e9);
        if (subseq === mer) {
          count++;
        }
      }
      return count;
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

    Sequence.prototype.group = function(dims) {
      var combine, depth, result;
      combine = function(args) {
        var atom, depth, group, groups, input, j, len, size;
        depth = args.depth, input = args.input;
        size = dims[depth];
        groups = [];
        group = [];
        for (j = 0, len = input.length; j < len; j++) {
          atom = input[j];
          group.push(atom);
          if (group.length === size) {
            groups.push(group);
            group = [];
          }
        }
        return groups;
      };
      result = this.sequence;
      depth = dims.length - 1;
      while (depth >= 0) {
        result = combine({
          depth: depth,
          input: result
        });
        depth = depth - 1;
      }
      return result;
    };

    Sequence.prototype.print = function(options) {
      var lines;
      lines = this.group([8, 8]);
      return lines.map(function(line) {
        return line.map(function(group) {
          return group.join('');
        }).join(' ');
      }).join('\n');
    };

    return Sequence;

  })();

  module.exports = Sequence;

}).call(this);
