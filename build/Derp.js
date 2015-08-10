(function() {
  var ALPHABET, enumeratePatterns, factorial, nChooseK;

  ALPHABET = '012345679ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  enumeratePatterns = function(args) {
    var _enumerate, alphabet, alphabet_size, length;
    alphabet_size = args.alphabet_size, length = args.length;
    alphabet = ALPHABET.slice(0, alphabet_size).split('');
    _enumerate = function(length) {
      var j, l, len, len1, letter, ref, result, suffix;
      if (length === 1) {
        return alphabet;
      } else {
        result = [];
        for (j = 0, len = alphabet.length; j < len; j++) {
          letter = alphabet[j];
          ref = _enumerate(length - 1);
          for (l = 0, len1 = ref.length; l < len1; l++) {
            suffix = ref[l];
            result.push("" + letter + suffix);
          }
        }
        return result;
      }
    };
    return _enumerate(length);
  };

  nChooseK = function(args) {
    var k, n;
    n = args.n, k = args.k;
    return factorial(n) / (factorial(k) * factorial(n - k));
  };

  factorial = (function() {
    var f, memo;
    memo = [];
    return f = function(n) {
      if (n <= 1) {
        return 1;
      } else if (typeof memo[n] !== 'undefined') {
        return memo[n];
      } else {
        return f[n] = f(n - 1) * n;
      }
    };
  })();

  module.exports = {
    Pr: function(args) {
      var alphabet_size, count, i, j, l, last_start, len, length, pattern, possible, ref, string, substr, t, times, total;
      length = args.length, alphabet_size = args.alphabet_size, times = args.times, pattern = args.pattern;
      possible = enumeratePatterns(args);
      total = possible.length;
      count = 0;
      last_start = length - pattern.length;
      for (j = 0, len = possible.length; j < len; j++) {
        string = possible[j];
        t = 0;
        for (i = l = 0, ref = last_start; 0 <= ref ? l <= ref : l >= ref; i = 0 <= ref ? ++l : --l) {
          substr = string.slice(i, i + pattern.length);
          if (substr === pattern) {
            t += 1;
          }
        }
        if (t >= times) {
          count += 1;
        }
      }
      return count / total;
    },
    PrA: function(args) {
      var alphabet_size, count, length, num_open, pattern, places, times, total;
      length = args.length, alphabet_size = args.alphabet_size, times = args.times, pattern = args.pattern;
      num_open = length - (times * pattern.length);
      places = num_open + times;
      count = nChooseK({
        n: num_open,
        k: places
      });
      total = Math.pow(alphabet_size, times * pattern.length);
      return count / total;
    }
  };

}).call(this);
