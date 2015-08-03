(function() {
  var BigInteger, Extend, Sequence,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Extend = require('extend');

  BigInteger = require("big-integer");

  Sequence = (function() {
    function Sequence(args) {
      if ('sequence' in args) {
        this.sequence = args.sequence.replace(/\s+/g, '').toUpperCase();
      }
      this.meta = 'meta' in args ? args.meta : {};
    }

    Sequence.converter = function(args) {
      var length, letters;
      length = args.length;
      letters = this.letters;
      return {
        merToNum: function(mer) {
          var i, index, j, k, letter, letter_to_num, num, power, ref, ref1, result;
          letter_to_num = {};
          for (i = j = 0, ref = letters.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
            letter = letters[i];
            letter_to_num[letter] = i;
          }
          result = BigInteger();
          for (i = k = 0, ref1 = mer.length; 0 <= ref1 ? k < ref1 : k > ref1; i = 0 <= ref1 ? ++k : --k) {
            index = (mer.length - 1) - i;
            letter = mer[index];
            power = BigInteger(letters.length).pow(i);
            num = BigInteger(letter_to_num[letter]);
            result = result.add(power.multiply(num));
          }
          return result.toString();
        },
        numToMer: function(num) {
          var divisor, i, index, letter, quotient, ref, remainder, result;
          if (!BigInteger.isInstance(num)) {
            num = BigInteger(num);
          }
          remainder = num;
          result = '';
          i = length - 1;
          while (i >= 0) {
            divisor = BigInteger(letters.length).pow(i);
            ref = remainder.divmod(divisor), quotient = ref.quotient, remainder = ref.remainder;
            index = quotient.toJSNumber();
            letter = letters[index];
            result += letter;
            i--;
          }
          return result;
        }
      };
    };

    Sequence.prototype.clumps = function(args) {
      var clumpIndex, clumps, converter, first_end, first_index, first_mer, first_start, first_window, freq_range, freqs, i, j, k, l, last, last_end, last_index, last_mer, last_start, len, len1, length, mer, ref, seq_length, times, window;
      window = args.window;
      times = args.times;
      length = args.length;
      clumps = [];
      freq_range = this.frequencyRange({
        length: args.length
      });
      clumpIndex = (function() {
        var j, len, results;
        results = [];
        for (j = 0, len = freq_range.length; j < len; j++) {
          i = freq_range[j];
          results.push(0);
        }
        return results;
      })();
      first_window = new this.constructor({
        sequence: this.sequence.slice(0, window)
      });
      freqs = first_window.frequencyArray({
        length: length
      });
      for (j = 0, len = freq_range.length; j < len; j++) {
        i = freq_range[j];
        if (freqs[i] >= times) {
          clumpIndex[i] = 1;
        }
      }
      seq_length = this.sequence.length;
      last = seq_length - window;
      converter = this.constructor.converter({
        length: length
      });
      for (i = k = 1, ref = last; 1 <= ref ? k <= ref : k >= ref; i = 1 <= ref ? ++k : --k) {
        first_start = i - 1;
        first_end = first_start + length;
        first_mer = this.sequence.slice(first_start, first_end);
        first_index = converter.merToNum(first_mer);
        freqs[first_index] -= 1;
        last_start = i + window - length;
        last_end = i + window;
        last_mer = this.sequence.slice(last_start, last_end);
        last_index = converter.merToNum(last_mer);
        freqs[last_index] += 1;
        if (freqs[last_index] >= times) {
          clumpIndex[last_index] = 1;
        }
      }
      for (l = 0, len1 = freq_range.length; l < len1; l++) {
        i = freq_range[l];
        if (clumpIndex[i] === 1) {
          mer = converter.numToMer(i);
          clumps.push(mer);
        }
      }
      return clumps;
    };

    Sequence.prototype.frequencyArray = function(args) {
      var converter, end, i, j, k, last, len, length, mer, num, ref, ref1, result, seq_length;
      length = args.length;
      result = [];
      ref = this.frequencyRange(args);
      for (j = 0, len = ref.length; j < len; j++) {
        i = ref[j];
        result[i] = 0;
      }
      converter = this.constructor.converter(args);
      seq_length = this.sequence.length;
      last = seq_length - length;
      for (i = k = 0, ref1 = last; 0 <= ref1 ? k <= ref1 : k >= ref1; i = 0 <= ref1 ? ++k : --k) {
        end = i + length;
        mer = this.sequence.slice(i, end);
        num = converter.merToNum(mer);
        result[num] = result[num] + 1;
      }
      return result;
    };

    Sequence.prototype.frequencyRange = function(args) {
      var j, length, letters, ref, results;
      length = args.length;
      letters = this.constructor.letters;
      return (function() {
        results = [];
        for (var j = 0, ref = Math.pow(letters.length, length) - 1; 0 <= ref ? j <= ref : j >= ref; 0 <= ref ? j++ : j--){ results.push(j); }
        return results;
      }).apply(this);
    };

    Sequence.prototype.group = function(args) {
      var combine, depth, dims, result;
      dims = args.dims;
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
        if (group.length > 0) {
          groups.push(group);
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

    Sequence.prototype.letterCounts = function() {
      var j, k, len, len1, letter, letters, ref, result;
      letters = this.constructor.letters;
      result = {};
      for (j = 0, len = letters.length; j < len; j++) {
        letter = letters[j];
        result[letter] = 0;
      }
      ref = this.sequence;
      for (k = 0, len1 = ref.length; k < len1; k++) {
        letter = ref[k];
        if ((indexOf.call(letters, letter) >= 0)) {
          result[letter] += 1;
        } else {
          throw new Error(this.constructor.name + ": invalid letter `" + letter + "`");
        }
      }
      return result;
    };

    Sequence.prototype.mer = function(mer) {
      var end, j, last_start, mer_length, ref, result, seq_length, start, subseq;
      result = {
        count: 0,
        positions: []
      };
      seq_length = this.sequence.length;
      mer_length = mer.length;
      last_start = seq_length - mer_length;
      for (start = j = 0, ref = last_start; 0 <= ref ? j <= ref : j >= ref; start = 0 <= ref ? ++j : --j) {
        end = start + mer_length - 1;
        subseq = this.sequence.slice(start, +end + 1 || 9e9);
        if (subseq === mer) {
          result.count++;
          result.positions.push(start);
        }
      }
      return result;
    };

    Sequence.prototype.mers = function(args) {
      var count, counts, end, j, last_start, length, max, mer, ref, result, seq_length, start;
      length = args.length;
      counts = {};
      seq_length = this.sequence.length;
      last_start = seq_length - length;
      for (start = j = 0, ref = last_start; 0 <= ref ? j <= ref : j >= ref; start = 0 <= ref ? ++j : --j) {
        end = start + length;
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
      result.max.mers.sort();
      return result;
    };

    Sequence.prototype.mers2 = function(args) {
      var converter, freqs, frequent, i, j, len, length, max, mer, ref;
      length = args.length;
      frequent = [];
      freqs = this.frequencyArray(args);
      max = Math.max.apply(null, freqs);
      converter = this.constructor.converter(args);
      ref = this.frequencyRange(args);
      for (j = 0, len = ref.length; j < len; j++) {
        i = ref[j];
        if (freqs[i] === max) {
          mer = converter.numToMer(i);
          frequent.push(mer);
        }
      }
      return {
        count: max,
        mers: frequent
      };
    };

    Sequence.prototype.mersSort = function(args) {
      var converter, end, frequent, i, index, j, k, l, last, length, max, mer, new_count, num, ref, ref1, ref2, seq_length;
      length = args.length;
      frequent = {
        index: [],
        count: [],
        patterns: []
      };
      converter = this.constructor.converter(args);
      seq_length = this.sequence.length;
      last = seq_length - length;
      for (i = j = 0, ref = last; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        end = i + length;
        mer = this.sequence.slice(i, end);
        index = converter.merToNum(mer);
        frequent.index[i] = index;
        frequent.count[i] = 1;
      }
      frequent.index.sort();
      max = 1;
      for (i = k = 1, ref1 = last; 1 <= ref1 ? k <= ref1 : k >= ref1; i = 1 <= ref1 ? ++k : --k) {
        if (frequent.index[i] === frequent.index[i - 1]) {
          new_count = frequent.count[i - 1] + 1;
          frequent.count[i] = new_count;
          if (new_count > max) {
            max = new_count;
          }
        }
      }
      for (i = l = 0, ref2 = last; 0 <= ref2 ? l <= ref2 : l >= ref2; i = 0 <= ref2 ? ++l : --l) {
        if (frequent.count[i] === max) {
          num = frequent.index[i];
          mer = converter.numToMer(num);
          frequent.patterns.push(mer);
        }
      }
      return {
        count: max,
        mers: frequent.patterns.sort()
      };
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
