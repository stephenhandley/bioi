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

  clumps : (args)->
    window = args.window # window size to look for clumps in, "L"
    times  = args.times  # minimum number of clump occurences, "t"
    length = args.length # mer length to look for, "k"

    clumps = []

    freq_range = @frequencyRange(length : args.length)

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
    for i in @frequencyRange(args)
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


  frequencyRange : (args)->
    {length} = args
    letters = @constructor.letters
    [0 .. (Math.pow(letters.length, length) - 1)]


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
    other_sequence = if Type(other, @constructor)
      other.sequence
    else
      other

    distance = 0

    for i in [0 ... @sequence.length]
      my_letter    = @sequence[i]
      other_letter = other_sequence[i]
      unless (my_letter is other_letter)
        distance += 1

    distance


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


  mer : (mer)->
    result = {
      count     : 0
      positions : []
    }

    seq_length = @sequence.length
    mer_length = mer.length
    last_start = seq_length - mer_length

    for start in [0 .. last_start]
      end = start + mer_length - 1
      subseq = @sequence[start .. end]
      if (subseq is mer)
        result.count++
        result.positions.push(start)

    result


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

    result = {
      max : {      # most frequently occurring mers
        count : 0
        mers  : []
      }
      all : {}     # counts keyed by mer
    }

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

    result.max.mers.sort()
    result

  # TODO: make result set similar to mers ?
  mers2 : (args)->
    {length} = args

    frequent  = []
    freqs     = @frequencyArray(args)
    max       = Math.max.apply(null, freqs)
    converter = @constructor.converter(args)

    for i in @frequencyRange(args)
      if (freqs[i] is max)
        mer = converter.numToMer(i)
        frequent.push(mer)

    {
      count : max
      mers  : frequent
    }

  # TODO: make result set similar to mers?
  mersSort : (args)->
    {length} = args # mer length to look for, "k"

    frequent = {
      index    : []
      count    : []
      patterns : []
    }

    converter = @constructor.converter(args)

    seq_length = @sequence.length
    last       = seq_length - length

    for i in [0 .. last]
      end = i + length
      mer = @sequence[i ... end]
      index = converter.merToNum(mer)
      frequent.index[i] = index
      frequent.count[i] = 1

    frequent.index.sort()

    max = 1
    for i in [1 .. last]
      if (frequent.index[i] is frequent.index[i - 1])
        new_count = frequent.count[i - 1] + 1
        frequent.count[i] = new_count
        if (new_count > max)
          max = new_count

    for i in [0 .. last]
      if (frequent.count[i] is max)
        num = frequent.index[i]
        mer = converter.numToMer(num)
        frequent.patterns.push(mer)

    {
      count : max
      mers  : frequent.patterns.sort()
    }


  print : (args)->
    lines = @group(dims: [8, 8])
    lines.map((line)->
      line.map((group)->
        group.join('')
      ).join(' ')
    ).join('\n')


module.exports = Sequence
