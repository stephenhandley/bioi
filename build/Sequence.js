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
      var i, j, len, len1, letter, letters, ref, result;
      letters = this.constructor.letters;
      result = {};
      for (i = 0, len = letters.length; i < len; i++) {
        letter = letters[i];
        result[letter] = 0;
      }
      ref = this.sequence;
      for (j = 0, len1 = ref.length; j < len1; j++) {
        letter = ref[j];
        if ((indexOf.call(letters, letter) >= 0)) {
          result[letter] += 1;
        } else {
          throw new Error(this.constructor.name + ": invalid letter `" + letter + "`");
        }
      }
      return result;
    };

    Sequence.prototype.merCount = function(mer) {
      var count, end, i, last_start, mer_length, ref, seq_length, start, subseq;
      count = 0;
      seq_length = this.sequence.length;
      mer_length = mer.length;
      last_start = seq_length - mer_length;
      for (start = i = 0, ref = last_start; 0 <= ref ? i <= ref : i >= ref; start = 0 <= ref ? ++i : --i) {
        end = start + mer_length - 1;
        subseq = this.sequence.slice(start, +end + 1 || 9e9);
        if (subseq === mer) {
          count++;
        }
      }
      return count;
    };

    Sequence.prototype.kMers = function(args) {
      var count, counts, end, i, k, last_start, max, mer, ref, result, seq_length, start;
      k = args.k;
      counts = {};
      seq_length = this.sequence.length;
      last_start = seq_length - k;
      for (start = i = 0, ref = last_start; 0 <= ref ? i <= ref : i >= ref; start = 0 <= ref ? ++i : --i) {
        end = start + k;
        mer = this.sequence.slice(start, end);
        if (!(mer in counts)) {
          counts[mer] = 0;
        }
        counts[mer] += 1;
      }
      result = {
        max: {
          count: 0,
          mers: []
        },
        all: {}
      };
      for (mer in counts) {
        count = counts[mer];
        if (count > 0) {
          result.all[mer] = count;
        }
        max = result.max.count;
        if (count > max) {
          result.max = {
            count: count,
            mers: [mer]
          };
        } else if (count === max) {
          result.max.mers.push(mer);
        }
      }
      return result;
    };

    Sequence.prototype.group = function(args) {
      var combine, depth, dims, result;
      dims = args.dims;
      combine = function(args) {
        var atom, depth, group, groups, i, input, len, size;
        depth = args.depth, input = args.input;
        size = dims[depth];
        groups = [];
        group = [];
        for (i = 0, len = input.length; i < len; i++) {
          atom = input[i];
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

    Sequence.prototype.print = function(args) {
      var lines;
      lines = this.group({
        dims: [8, 8]
      });
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
