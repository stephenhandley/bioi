Sequence = require('./Sequence')

class Dna extends Sequence
  @letters = ['A', 'C', 'T', 'G']

  # replication origin
  locateOriC : ()->
    console.log('unimplemented')

module.exports = Dna
