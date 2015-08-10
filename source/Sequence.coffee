Extend     = require('extend')
BigInteger = require('big-integer')
Type       = require('type-of-is')

class Sequence
  constructor : (args)->
    if ('sequence' of args)
      @sequence = args.sequence.replace(/\s+/g,'').toUpperCase()

    @meta = if ('meta' of args)
      args.meta
    else
      {}


  @converter : (args)->
    {length} = args
    letters  = @letters

    {
      merToNum : (mer)->
        letter_to_num = {}
        for i in [0 ... letters.length]
          letter = letters[i]
          letter_to_num[letter] = i

        result = BigInteger()

        for i in [0 ... mer.length]
          index   = (mer.length - 1) - i
          letter  = mer[index]
          power   = BigInteger(letters.length).pow(i)
          num     = BigInteger(letter_to_num[letter])
          result  = result.add(power.multiply(num))

        result.toString()

      numToMer : (num)->
        unless BigInteger.isInstance(num)
          num = BigInteger(num)

        remainder = num
        result    = ''
        i         = length - 1

        while (i >= 0)
          divisor = BigInteger(letters.length).pow(i)
          {quotient, remainder} = remainder.divmod(divisor)

          index   = quotient.toJSNumber()
          letter  = letters[index]
          result += letter
          i--

        result
    }


  @hammingDistance : (a, b)->
    [a, b] = (x.toString() for x in [a, b])

    distance = 0

    for i in [0 ... a.length]
      unless (a[i] is b[i])
        distance += 1

    distance


  @neighbors : (args)->
    {mer, distance} = args

    if (distance is 0)
      [mer]
    else if (mer.length is 1)
      letter for letter in @letters
    else
      neighbors        = []
      suffix           = mer[1 .. -1]
      suffix_neighbors = @neighbors(
        mer      : suffix
        distance : distance
      )

      for str in suffix_neighbors
        if (@hammingDistance(str, suffix) < distance)
          for letter in @letters
            neighbor = "#{letter}#{str}"
            neighbors.push(neighbor)
        else
          neighbor = "#{mer[0]}#{str}"
          neighbors.push(neighbor)

      neighbors


  clumps : (args)->
    window = args.window # window size to look for clumps in, "L"
    times  = args.times  # minimum number of clump occurences, "t"
    length = args.length # mer length to look for, "k"

    clumps = []

    freq_range = @_frequencyRange(length : args.length)

    clumpIndex = (0 for i in freq_range)

    first_window = new @constructor(sequence : @sequence[0 ... window])
    freqs = first_window.frequencyArray(length : length)

    for i in freq_range
      if (freqs[i] >= times)
        clumpIndex[i] = 1

    seq_length = @sequence.length
    last       = seq_length - window
    converter  = @constructor.converter(length : length)

    for i in [1 .. last]
      first_start = i - 1
      first_end   = first_start + length
      first_mer   = @sequence[first_start ... first_end]
      first_index = converter.merToNum(first_mer)
      freqs[first_index] -= 1

      last_start = i + window - length
      last_end   = i + window
      last_mer   = @sequence[last_start ... last_end]
      last_index = converter.merToNum(last_mer)
      freqs[last_index] += 1

      if (freqs[last_index] >= times)
        clumpIndex[last_index] = 1

    for i in freq_range
      if (clumpIndex[i] is 1)
        mer = converter.numToMer(i)
        clumps.push(mer)

    clumps


  frequencyArray : (args)->
    {length} = args

    result = []
    for i in @_frequencyRange(args)
      result[i] = 0

    converter = @constructor.converter(args)

    seq_length = @sequence.length
    last       = seq_length - length

    for i in [0 .. last]
      end = i + length
      mer = @sequence[i ... end]
      num = converter.merToNum(mer)

      result[num] = result[num] + 1

    result


  group : (args)->
    {dims} = args

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

      if (group.length > 0)
        groups.push(group)

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


  hammingDistance : (other)->
    @constructor.hammingDistance(@, other)


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


  _mer : (args)->
    {mer, filter} = args

    positions = []

    seq_length = @sequence.length
    mer_length = mer.length
    last_start = seq_length - mer_length

    for start in [0 .. last_start]
      end = start + mer_length - 1
      subseq = @sequence[start .. end]
      if filter(subseq)
        positions.push(start)

    positions


  mer : (args)->
    {mer} = args

    args.filter = (subseq)->
      (subseq is mer)

    @_mer(args)


  merApproximate : (args)->
    {mer, distance} = args
    mer_seq = new @constructor(sequence : mer)

    args.filter = (subseq)->
      (mer_seq.hammingDistance(subseq) <= distance)

    @_mer(args)


  merApproximateCount : (args)->
    @merApproximate(args).length

  _mersResultStructure : ()->
     {
      max : {      # most frequently occurring mers
        count : 0
        mers  : []
      }
      all : {}     # counts keyed by mer
    }

  mers : (args)->
    {length} = args # mer length to look for, "k"

    counts     = {}
    seq_length = @sequence.length
    last_start = seq_length - length

    for start in [0 .. last_start]
      end = start + length
      mer = @sequence[start ... end]
      unless mer of counts
        counts[mer] = 0
      counts[mer] += 1

    result = @_mersResultStructure()

    for mer, count of counts
      if (count > 0)
        result.all[mer] = count

      max = result.max.count

      if (count > max)
        result.max = {
          count : count
          mers  : [mer]
        }
      else if (count is max)
        result.max.mers.push(mer)

    result


  # TODO: make result set similar to mers ?
  mers2 : (args)->
    {length} = args

    result = @_mersResultStructure()

    freqs     = @frequencyArray(args)
    converter = @constructor.converter(args)
    max       = Math.max.apply(null, freqs)

    for i in @_frequencyRange(args)
      count = freqs[i]
      mer   = converter.numToMer(i)

      if (count > 0)
        result.all[mer] = count

      if (count is result.max)
        result.max.mers.push(mer)

    result.max.count = max
    result


  # TODO: make result set similar to mers?
  mersSort : (args)->
    {length} = args # mer length to look for, "k"

    result  = @_mersResultStructure()
    indexes = []
    counts  = []

    converter = @constructor.converter(args)

    seq_length = @sequence.length
    last       = seq_length - length

    for i in [0 .. last]
      end = i + length
      mer = @sequence[i ... end]
      index = converter.merToNum(mer)
      indexes[i] = index
      counts[i]  = 1

    indexes.sort()

    max = 1
    for i in [1 .. last]
      if (indexes[i] is indexes[i - 1])
        new_count = counts[i - 1] + 1
        counts[i] = new_count
        if (new_count > max)
          max = new_count

    result.max.count = max

    for i in [0 .. last]
      count = counts[i]
      index = indexes[i]
      mer   = converter.numToMer(index)

      result.all[mer] = count

      if (count is max)
        result.max.mers.push(mer)

    result


  mersApproximate : (args)->
    {length, distance} = args

    converter = @constructor.converter(args)

    result    = @_mersResultStructure()
    indexes   = []
    counts    = []
    neighbors = []

    seq_length = @sequence.length
    last_start = seq_length - length

    for start in [0 .. last_start]
      end = start + length
      mer = @sequence[start ... end]

      mer_neighbors = @constructor.neighbors(
        mer      : mer
        distance : distance
      )

      neighbors = neighbors.concat(mer_neighbors)

    for i in [0 ... neighbors.length]
      mer        = neighbors[i]
      index      = converter.merToNum(mer)
      indexes[i] = index
      counts[i]  = 1

    indexes.sort()

    max = 1
    for i in [0 ... indexes.length]
      if (indexes[i] is indexes[i + 1])
        new_count     = counts[i] + 1
        counts[i + 1] = new_count

        if (new_count > max)
          max = new_count

    result.max.count = max

    for i in [0 ... neighbors.length]
      count = counts[i]
      index = indexes[i]
      mer   = converter.numToMer(index)

      result.all[mer] = count

      if (count is max)
        result.max.mers.push(mer)

    result


  print : (args)->
    lines = @group(dims: [8, 8])
    lines.map((line)->
      line.map((group)->
        group.join('')
      ).join(' ')
    ).join('\n')


  toString : ()->
    @sequence


  _frequencyRange : (args)->
    {length} = args
    letters = @constructor.letters
    [0 .. (Math.pow(letters.length, length) - 1)]

module.exports = Sequence
