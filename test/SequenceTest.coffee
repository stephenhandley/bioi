Assert = require('assert')

Bioi = require('../')

vibrioCholeraeOriC = """
  atcaatgatcaacgtaagcttctaagcatgatcaaggtgctcacacagtttatccacaac
  ctgagtggatgacatcaagataggtcgttgtatctccttcctctcgtactctcatgacca
  cggaaagatgatcaagagaggatgatttcttggccatatcgcaatgaatacttgtgactt
  gtgcttccaattgacatcttcagcgccatattgcgctggccaaggtgacggagcgggatt
  acgaaagcatgatcatggctgttgttctgtttatcttgttttgactgagacttgttagga
  tagacggtttttcatcactgactagccaaagccttactctgcctgacatcgaccgtaaat
  tgataatgaatttacatgcttccgcgacgatttacctcttgatcatcgatccgattgaag
  atcttcaattgttaattctcttgcctcgactcatagccatgatgagctcttgatcatgtt
  tccttaaccctctattttttacggaagaatgatcaagctgctgctcttgatcatcgtttc
"""

_construct = (test)->
  new test.Type(sequence : test.sequence)

module.exports = {
  'Sequence': {
    'constructor': {
      'should construct properly': ()->
        sequence = 'ACTGATCGATTCAGTCAG'
        dna = new Bioi.Dna(sequence : sequence)
        Assert.equal(sequence, dna.sequence)
    }

    'merCount': {
      'should return count of mer': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACAACTATGCATACTATCGGGAACTATCCT'
            mer      : 'ACTAT'
            count    : 3
          }
          {
            Type     : Bioi.Dna
            sequence : 'CGATATATCCATAG'
            mer      : 'ATA'
            count    : 3
          }
        ]

        for test in tests
          sequence = _construct(test)
          count = sequence.merCount(test.mer)
          Assert.equal(count, test.count)
    },

    'letterCounts': {
      'should return counts of letters': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACTGAAATTCTGAGGCT'
            counts   : {
              A : 5
              C : 3
              T : 5
              G : 4
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'TTTTTT'
            counts   : {
              A : 0
              C : 0
              T : 6
              G : 0
            }
          }
          {
            Type     : Bioi.Dna
            sequence : """
              AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATT
              AAAAAAAGAGTGTCTGATAGCAGC
            """
            counts   : {
              A: 20
              C: 12
              T: 21
              G: 17
            }
          }
        ]

        for test in tests
          sequence = _construct(test)
          counts = sequence.letterCounts()
          Assert.deepEqual(counts, test.counts)
    }

    'kMers': {
      'should return count of mers of length k': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : """
              AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATT
              AAAAAAAGAGTGTCTGATAGCAGCTGACAAGGCTGACAAGGCTGAC
              AAGGCTTTGTACCCTGACAAGGCCTCGCACCAGTTTGTACCCTTTG
              TACCCTTTGTACCCAGATTTGACTTTTGTACCCCGTAGTGCGCCGT
              AGTGCGCTGACAAGGCAGATTTGACTCGTAGTGCGCCGTAGTGCGC
              TGACAAGGCCGTAGTGCGCAGATTTGACTTGACAAGGCCTCGCACC
              AGAGATTTGACTAGATTTGACTAGATTTGACTTGACAAGGCCGTAG
              TGCGCTTTGTACCCCGTAGTGCGCCGTAGTGCGCCTCGCACCAGCG
              TAGTGCGCTGACAAGGCCTCGCACCAGAGATTTGACTTTTGTACCC
              CGTAGTGCGCTGACAAGGCTGACAAGGCTGACAAGGCTTTGTACCC
              CTCGCACCAGAGATTTGACTCTCGCACCAGTTTGTACCCAGATTTG
              ACTTGACAAGGCTTTGTACCCAGATTTGACTTGACAAGGCCTCGCA
              CCAGAGATTTGACTCGTAGTGCGCTTTGTACCCAGATTTGACTCGT
              AGTGCGCCTCGCACCAGTGACAAGGCAGATTTGACTAGATTTGACT
              TTTGTACCCTGACAAGGCTGACAAGGCTGACAAGGCCTCGCACCAG
              TTTGTACCCTGACAAGGCCGTAGTGCGCAGATTTGACTCGTAGTGC
              GCAGATTTGACTCGTAGTGCGCCTCGCACCAGTTTGTACCCCTCGC
              ACCAGTTTGTACCCTGACAAGGCTGACAAGGCAGATTTGACTCTCG
              CACCAGCTCGCACCAGCGTAGTGCGCAGATTTGACTAGATTTGACT
              CGTAGTGCGCAGATTTGACTCTCGCACCAGTGACAAGGCTGACAAG
              GCAGATTTGACTTTTGTACCCCGTAGTGCGCTTTGTACCCTGACAA
              GGC
            """
            k : 11
            kMers : ['GCTGACAAGGC', 'CAGATTTGACT']
          }
        ]

        for test in tests
          sequence = _construct(test)
          kMers = sequence.kMers(test.k)
          Assert.deepEqual(kMers, test.kMers)
    }

    'print' : {
      'should fuckn print' : ()->
        sequence = new Bioi.Dna(sequence : vibrioCholeraeOriC)
        printed = sequence.print()
        expected = [
          'ATCAATGA TCAACGTA AGCTTCTA AGCATGAT CAAGGTGC TCACACAG TTTATCCA CAACCTGA',
          'GTGGATGA CATCAAGA TAGGTCGT TGTATCTC CTTCCTCT CGTACTCT CATGACCA CGGAAAGA',
          'TGATCAAG AGAGGATG ATTTCTTG GCCATATC GCAATGAA TACTTGTG ACTTGTGC TTCCAATT',
          'GACATCTT CAGCGCCA TATTGCGC TGGCCAAG GTGACGGA GCGGGATT ACGAAAGC ATGATCAT',
          'GGCTGTTG TTCTGTTT ATCTTGTT TTGACTGA GACTTGTT AGGATAGA CGGTTTTT CATCACTG',
          'ACTAGCCA AAGCCTTA CTCTGCCT GACATCGA CCGTAAAT TGATAATG AATTTACA TGCTTCCG',
          'CGACGATT TACCTCTT GATCATCG ATCCGATT GAAGATCT TCAATTGT TAATTCTC TTGCCTCG',
          'ACTCATAG CCATGATG AGCTCTTG ATCATGTT TCCTTAAC CCTCTATT TTTTACGG AAGAATGA'
        ].join('\n')
        Assert.equal(printed, expected)
    }
  }
}
