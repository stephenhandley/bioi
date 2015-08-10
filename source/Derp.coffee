# ```
# We are interested in computing the following probabilities for a random N-letter string in an A-letter alphabet:
# • Pr(N, A, Pattern, t), the probability that a string Pattern appears at least t times in a random string;
# • Pr⇤(N, A, Pattern, t), the probability that a string Pattern and its reverse comple- ment Pattern appear at least t total times in a random string.
# PAGE 52
# ￼￼￼PAGE 62
# ￼37
# WHERE IN THE GENOME DOES DNA REPLICATION BEGIN?
# Note that the above two probabilities are relatively straightforward to compute. Several variants of these are open:
# • Prd(N, A, Pattern, t), the probability that a string Pattern approximately appears at least t times in a random string (with at most d mismatches);
# • Pr(N, A, k, t), the probability that there exists any k-mer appearing at least t times in a random string;
# • Prd(N, A, k, t), the probability that there exists any k-mer with at least t approxi- mate occurrences in a random string (with at most d mismatches).
# ```


# NONE OF THIS STUFF WORKS PROPERLY YET

ALPHABET = '012345679ABCDEFGHIJKLMNOPQRSTUVWXYZ' # hacky shack

# TODO: this is naive implementation.. enumeration isn't workable for hi length
enumeratePatterns = (args)->
  {alphabet_size, length} = args
  alphabet = ALPHABET[0...alphabet_size].split('')

  _enumerate = (length)->
    if (length is 1)
      alphabet
    else
      result = []
      for letter in alphabet
        for suffix in _enumerate(length - 1)
          result.push("#{letter}#{suffix}")
      result

  _enumerate(length)

nChooseK = (args)->
  {n, k} = args
  factorial(n) / (factorial(k) * factorial(n - k))

factorial = (()->
  memo = []

  f = (n)->
    if (n <= 1)
      1
    else if (typeof memo[n] isnt 'undefined')
      memo[n]
    else
      f[n] = f(n-1) * n
)()

module.exports = {
  Pr : (args)->
    {length, alphabet_size, times, pattern} = args

    possible   = enumeratePatterns(args)
    total      = possible.length
    count      = 0
    last_start = length - pattern.length

    for string in possible
      t = 0
      for i in [0 .. last_start]
        substr = string[i ... (i + pattern.length)]
        if (substr is pattern)
          t += 1

      if (t >= times)
        count += 1

    count / total

  PrA : (args)->
    {length, alphabet_size, times, pattern} = args
    num_open = length - (times * pattern.length)
    places = num_open + times

    count = nChooseK(
      n: num_open
      k: places
    )

    total = Math.pow(alphabet_size, times * pattern.length)

    count / total
}
