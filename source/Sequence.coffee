class Sequence
  constructor : (args)->
    if ('sequence' of args)
      @sequence = args.sequence.trim().toUpperCase()

    @meta = if ('meta' of args)
      args.meta
    else
      {}

  count : (mer)->
    count = 0

    seqlen = @sequence.length
    merlen = mer.length

    for i in [0 .. (seqlen - merlen)]
      subseq = @sequence[i .. (i + merlen - 1)]
      if (subseq is mer)
        count++

    count

  counts : ()->
    alphabet = @constructor.alphabet

    result = {}
    for base in alphabet
      result[base] = 0

    for base in @sequence
      if (base in alphabet)
        result[base] += 1
      else
        throw new Error("DNA: Invalid base: #{base}")

    result

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

module.exports = Sequence
