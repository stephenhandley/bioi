Assert = require('assert')

Bioi = require('../../')

module.exports = {
  'Scoring': {
    'entropy': {
      'should calculate entropy on distribution': ()->
        tests = [
          {
            distribution : [0.2, 0.6, 0.0, 0.2]
            entropy      : "1.371"
          }
          {
            distribution : [0.0, 0.6, 0.0, 0.4]
            entropy      : "0.971"
          }
          {
            distribution : [0.0, 0.0, 0.9, 0.1]
            entropy      : "0.469"
          }
        ]

        for test in tests
          val = Bioi.Scoring.entropy(test.distribution)
          Assert.equal(val.toFixed(3), test.entropy)
    }
  }
}
