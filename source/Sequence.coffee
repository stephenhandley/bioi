Extend = require('extend')

class Sequence
  constructor : (args)->
    if ('sequence' of args)
      @sequence = args.sequence.replace(/\s+/g,'').toUpperCase()

    @meta = if ('meta' of args)
      args.meta
    else
      {}


  letterCounts : ()->
    letters = @constructor.letters

    result = {}
    for letter in letters
      result[letter] = 0

    for letter in @sequence
      if (letter in letters)
        result[letter] += 1
      else
        throw new Error("#{@constructor.name}: invalid letter `#{letter}`")

    result


  merCount : (mer)->
    count      = 0
    seq_length = @sequence.length
    mer_length = mer.length
    last_start = seq_length - mer_length

    for start in [0 .. last_start]
      end = start + mer_length - 1
      subseq = @sequence[start .. end]
      if (subseq is mer)
        count++

    count


  kMers : (k)->
    counts = {}
    seqlen = @sequence.length

    for i in [0 .. (seqlen - k)]
      mer = @sequence[i .. (i + k - 1)]
      unless mer of counts
        counts[mer] = 0
      counts[mer] += 1

    max = [{count : 0}]
    for mer, count of counts
      current_max = max[0].count
      pair = {mer : mer , count : count}

      if (count > current_max)
        max = [pair]
      else if (count == current_max)
        max.push(pair)

    pair.mer for pair in max


  group : (dims)->
    combine = (args)->
      {depth, input} = args

      size = dims[depth]

      groups = []
      group  = []

      for atom in input
        group.push(atom)

        if (group.length is size)
          groups.push(group)
          group = []

      groups

    result = @sequence
    depth  = dims.length - 1

    while (depth >= 0)
      result = combine(
        depth : depth
        input : result
      )
      depth = depth - 1

    result

  print : (options)->
    lines = @group([8, 8])
    lines.map((line)->
      line.map((group)->
        group.join('')
      ).join(' ')
    ).join('\n')







module.exports = Sequence
