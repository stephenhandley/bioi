Sequence = require('./Sequence')

class Dna extends Sequence
  @letters = ['A', 'C', 'G', 'T']

  @complement_map : {
    A : 'T'
    C : 'G'
    G : 'C'
    T : 'A'
  }

  # replication origin
  locateOriC : ()->
    console.log('unimplemented')

  complement : ()->
    map = @constructor.complement_map
    (map[letter] for letter in @sequence).join('')

module.exports = Dna
