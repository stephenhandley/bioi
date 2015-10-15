Assert = require('assert')
Derp = require('../../source/Derp')

module.exports = {
  'Derp' : {
    'does something' : ()->
      tests = [
        {
          length        : 4
          alphabet_size : 2
          pattern       : "01"
          times         : 1
          result        : 11/16
        }
        {
          length        : 4
          alphabet_size : 2
          pattern       : "11"
          times         : 1
          result        : 1/2
        }
        {
          length        : 4
          alphabet_size : 2
          pattern       : "01"
          times         : 2
          result        : 1/16
        }
        {
          length        : 4
          alphabet_size : 2
          pattern       : "11"
          times         : 2
          result        : 3/16
        }
        {
          length        : 7
          alphabet_size : 3
          pattern       : "01"
          times         : 2
          result        : 0.11248285322359397
        }
      ]

      for test in tests
        result = Derp.Pr(test)
        Assert.equal(result, test.result)

      approx = Derp.PrA(
        length        : 30
        alphabet_size : 4
        pattern       : "01303"
        times         : 3
      )
  }
}

# Pr(4, 2, "01", 1) = 11/16 while Pr(4, 2, "11", 1) = 1/2.
#  Interestingly, when we make t greater than 1, we see that "01"
#  is less likely to appear multiple times than "11". For example,
#  the probability of finding "01" twice or more in a random binary
#  4-mer is given by Pr(4, 2, "01", 2) = 1/16 because "0101" is the
#   only binary 4-mer containing "01" twice, and yet Pr(4, 2, "11", 2) = 3/16
#    because binary 4-mers "0111", "1110" and "1111" all have at least two occurrences of "11".
