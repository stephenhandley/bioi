Sequence = require('./Sequence')

class Dna extends Sequence
  @letters : ['A', 'C', 'G', 'T']

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
    result = ''
    end = @sequence.length - 1

    for i in [end .. 0]
      letter = @sequence[i]
      result += map[letter]

    result

  DnaABox : ()->

module.exports = Dna
