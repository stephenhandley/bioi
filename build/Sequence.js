(function() {
  var BigInteger, Extend, Sequence, Type,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Extend = require('extend');

  BigInteger = require('big-integer');

  Type = require('type-of-is');

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

    Sequence.hammingDistance = function(a, b) {
      var distance, i, j, ref, ref1, x;
      ref = (function() {
        var j, len, ref, results;
        ref = [a, b];
        results = [];
        for (j = 0, len = ref.length; j < len; j++) {
          x = ref[j];
          results.push(x.toString());
        }
        return results;
      })(), a = ref[0], b = ref[1];
      distance = 0;
      for (i = j = 0, ref1 = a.length; 0 <= ref1 ? j < ref1 : j > ref1; i = 0 <= ref1 ? ++j : --j) {
        if (!(a[i] === b[i])) {
          distance += 1;
        }
      }
      return distance;
    };

    Sequence.neighbors = function(args) {
      var distance, j, k, l, len, len1, len2, letter, mer, neighbor, neighbors, ref, ref1, results, str, suffix, suffix_neighbors;
      mer = args.mer, distance = args.distance;
      if (distance === 0) {
        return [mer];
      } else if (mer.length === 1) {
        ref = this.letters;
        results = [];
        for (j = 0, len = ref.length; j < len; j++) {
          letter = ref[j];
          results.push(letter);
        }
        return results;
      } else {
        neighbors = [];
        suffix = mer.slice(1);
        suffix_neighbors = this.neighbors({
          mer: suffix,
          distance: distance
        });
        for (k = 0, len1 = suffix_neighbors.length; k < len1; k++) {
          str = suffix_neighbors[k];
          if (this.hammingDistance(str, suffix) < distance) {
            ref1 = this.letters;
            for (l = 0, len2 = ref1.length; l < len2; l++) {
              letter = ref1[l];
              neighbor = "" + letter + str;
              neighbors.push(neighbor);
            }
          } else {
            neighbor = "" + mer[0] + str;
            neighbors.push(neighbor);
          }
        }
        return neighbors;
      }
    };

    Sequence.prototype.clumps = function(args) {
      var clumpIndex, clumps, converter, first_end, first_index, first_mer, first_start, first_window, freq_range, freqs, i, j, k, l, last, last_end, last_index, last_mer, last_start, len, len1, length, mer, ref, seq_length, times, window;
      window = args.window;
      times = args.times;
      length = args.length;
      clumps = [];
      freq_range = this._frequencyRange({
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
      ref = this._frequencyRange(args);
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

    Sequence.prototype.hammingDistance = function(other) {
      return this.constructor.hammingDistance(this, other);
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

    Sequence.prototype._mer = function(args) {
      var end, filter, j, last_start, mer, mer_length, positions, ref, seq_length, start, subseq;
      mer = args.mer, filter = args.filter;
      positions = [];
      seq_length = this.sequence.length;
      mer_length = mer.length;
      last_start = seq_length - mer_length;
      for (start = j = 0, ref = last_start; 0 <= ref ? j <= ref : j >= ref; start = 0 <= ref ? ++j : --j) {
        end = start + mer_length - 1;
        subseq = this.sequence.slice(start, +end + 1 || 9e9);
        if (filter(subseq)) {
          positions.push(start);
        }
      }
      return positions;
    };

    Sequence.prototype.mer = function(args) {
      var mer;
      mer = args.mer;
      args.filter = function(subseq) {
        return subseq === mer;
      };
      return this._mer(args);
    };

    Sequence.prototype.merApproximate = function(args) {
      var distance, mer, mer_seq;
      mer = args.mer, distance = args.distance;
      mer_seq = new this.constructor({
        sequence: mer
      });
      args.filter = function(subseq) {
        return mer_seq.hammingDistance(subseq) <= distance;
      };
      return this._mer(args);
    };

    Sequence.prototype.merApproximateCount = function(args) {
      return this.merApproximate(args).length;
    };

    Sequence.prototype._mersResultStructure = function() {
      return {
        max: {
          count: 0,
          mers: []
        },
        all: {}
      };
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
      result = this._mersResultStructure();
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

    Sequence.prototype.mers2 = function(args) {
      var converter, count, freqs, i, j, len, length, max, mer, ref, result;
      length = args.length;
      result = this._mersResultStructure();
      freqs = this.frequencyArray(args);
      converter = this.constructor.converter(args);
      max = Math.max.apply(null, freqs);
      ref = this._frequencyRange(args);
      for (j = 0, len = ref.length; j < len; j++) {
        i = ref[j];
        count = freqs[i];
        mer = converter.numToMer(i);
        if (count > 0) {
          result.all[mer] = count;
        }
        if (count === result.max) {
          result.max.mers.push(mer);
        }
      }
      result.max.count = max;
      return result;
    };

    Sequence.prototype.mersSort = function(args) {
      var converter, count, counts, end, i, index, indexes, j, k, l, last, length, max, mer, new_count, ref, ref1, ref2, result, seq_length;
      length = args.length;
      result = this._mersResultStructure();
      indexes = [];
      counts = [];
      converter = this.constructor.converter(args);
      seq_length = this.sequence.length;
      last = seq_length - length;
      for (i = j = 0, ref = last; 0 <= ref ? j <= ref : j >= ref; i = 0 <= ref ? ++j : --j) {
        end = i + length;
        mer = this.sequence.slice(i, end);
        index = converter.merToNum(mer);
        indexes[i] = index;
        counts[i] = 1;
      }
      indexes.sort();
      max = 1;
      for (i = k = 1, ref1 = last; 1 <= ref1 ? k <= ref1 : k >= ref1; i = 1 <= ref1 ? ++k : --k) {
        if (indexes[i] === indexes[i - 1]) {
          new_count = counts[i - 1] + 1;
          counts[i] = new_count;
          if (new_count > max) {
            max = new_count;
          }
        }
      }
      result.max.count = max;
      for (i = l = 0, ref2 = last; 0 <= ref2 ? l <= ref2 : l >= ref2; i = 0 <= ref2 ? ++l : --l) {
        count = counts[i];
        index = indexes[i];
        mer = converter.numToMer(index);
        result.all[mer] = count;
        if (count === max) {
          result.max.mers.push(mer);
        }
      }
      return result;
    };

    Sequence.prototype.mersApproximate = function(args) {
      var converter, count, counts, distance, end, i, index, indexes, j, k, l, last_start, length, m, max, mer, mer_neighbors, neighbors, new_count, ref, ref1, ref2, ref3, result, seq_length, start;
      length = args.length, distance = args.distance;
      converter = this.constructor.converter(args);
      result = this._mersResultStructure();
      indexes = [];
      counts = [];
      neighbors = [];
      seq_length = this.sequence.length;
      last_start = seq_length - length;
      for (start = j = 0, ref = last_start; 0 <= ref ? j <= ref : j >= ref; start = 0 <= ref ? ++j : --j) {
        end = start + length;
        mer = this.sequence.slice(start, end);
        mer_neighbors = this.constructor.neighbors({
          mer: mer,
          distance: distance
        });
        neighbors = neighbors.concat(mer_neighbors);
      }
      for (i = k = 0, ref1 = neighbors.length; 0 <= ref1 ? k < ref1 : k > ref1; i = 0 <= ref1 ? ++k : --k) {
        mer = neighbors[i];
        index = converter.merToNum(mer);
        indexes[i] = index;
        counts[i] = 1;
      }
      indexes.sort();
      max = 1;
      for (i = l = 0, ref2 = indexes.length; 0 <= ref2 ? l < ref2 : l > ref2; i = 0 <= ref2 ? ++l : --l) {
        if (indexes[i] === indexes[i + 1]) {
          new_count = counts[i] + 1;
          counts[i + 1] = new_count;
          if (new_count > max) {
            max = new_count;
          }
        }
      }
      result.max.count = max;
      for (i = m = 0, ref3 = neighbors.length; 0 <= ref3 ? m < ref3 : m > ref3; i = 0 <= ref3 ? ++m : --m) {
        count = counts[i];
        index = indexes[i];
        mer = converter.numToMer(index);
        result.all[mer] = count;
        if (count === max) {
          result.max.mers.push(mer);
        }
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

    Sequence.prototype.toString = function() {
      return this.sequence;
    };

    Sequence.prototype._frequencyRange = function(args) {
      var j, length, letters, ref, results;
      length = args.length;
      letters = this.constructor.letters;
      return (function() {
        results = [];
        for (var j = 0, ref = Math.pow(letters.length, length) - 1; 0 <= ref ? j <= ref : j >= ref; 0 <= ref ? j++ : j--){ results.push(j); }
        return results;
      }).apply(this);
    };

    return Sequence;

  })();

  module.exports = Sequence;

}).call(this);
