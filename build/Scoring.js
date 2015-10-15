(function() {
  module.exports = {
    entropy: function(distribution) {
      var log2;
      log2 = function(n) {
        return Math.log(n) / Math.log(2);
      };
      return -1 * (distribution.map(function(n) {
        if (n === 0) {
          return 0;
        } else {
          return n * log2(n);
        }
      }).reduce(function(a, b) {
        return a + b;
      }));
    }
  };

}).call(this);
