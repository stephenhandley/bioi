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
    throw new Error('unimplemented')


  locateTerC : ()->
    throw new Error('unimplemented')


  minimumSkew : ()->
    skews   = @skews()
    min     = Infinity
    indexes = []

    for i in [1 ... skews.length]
      skew = skews[i]
      if (skew < min)
        min = skew
        indexes = [i]
      else if (skew is min)
        indexes.push(i)

    indexes


  skews : ()->
    result = [0]
    for i in [0 ... @sequence.length]
      previous = @sequence[i]
      delta = switch previous
        when 'C' then -1
        when 'G' then +1
        else 0

      skew = result[i] + delta
      result.push(skew)

    result


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
