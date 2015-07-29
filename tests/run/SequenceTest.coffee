Assert = require('assert')

Bioi = require('../../')
VibrioCholerae = require('../data/VibrioCholerae')

_construct = (test)->
  new test.Type(sequence : test.sequence)

module.exports = {
  'Sequence': {
    'constructor': {
      'should construct properly': ()->
        sequence = 'ACTGATCGATTCAGTCAG'
        dna      = new Bioi.Dna(sequence : sequence)
        Assert.equal(sequence, dna.sequence)
    }

    'mer': {
      'should return count and positions of mer': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACAACTATGCATACTATCGGGAACTATCCT'
            mer      : 'ACTAT'
            result   : {
              count     : 3,
              positions : [ 3, 12, 22 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'CGATATATCCATAG'
            mer      : 'ATA'
            result   : {
              count     : 3,
              positions : [ 2, 4, 10 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'ACTGTACGATGATGTGTGTCAAAG'
            mer      : 'TGT'
            result   : {
              count     : 4,
              positions : [ 2, 12, 14, 16 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'GCGCG'
            mer      : 'GCG'
            result   : {
              count     : 2,
              positions : [ 0, 2 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'ACGTACGTACGT'
            mer      : 'CG'
            result   : {
              count     : 3,
              positions : [ 1, 5, 9 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT'
            mer      : 'AAA'
            result   : {
              count     : 4,
              positions : [ 0, 46, 51, 74 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT'
            mer      : 'TTT'
            result   : {
              count     : 4,
              positions : [ 88, 92, 98, 132 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'GGACTTACTGACGTACG'
            mer      : 'ACT'
            result   : {
              count     : 2,
              positions : [ 2, 6 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'ATCCGATCCCATGCCCATG'
            mer      : 'CC'
            result   : {
              count     : 5,
              positions : [ 2, 7, 8, 13, 14 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'CTGTTTTTGATCCATGATATGTTATCTCTCCGTCATCAGAAGAACAGTGACGGATCGCCCTCTCTCTTGGTCAGGCGACCGTTTGCCATAATGCCCATGCTTTCCAGCCAGCTCTCAAACTCCGGTGACTCGCGCAGGTTGAGTA'
            mer      : 'CTC'
            result   : {
              count     : 9,
              positions : [ 25, 27, 59, 61, 63, 111, 113, 119, 128 ]
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'TAGGGTGTCATTGTAGGGTGAACGTTTAGGGTGCCTAGGGTGGACTTAGGGTGCTAGGGTGTAGGGTGTTAGGGTGTTTGGGGGTAGGGTGTAGGGTGCGTAGGGTGTAGGGTGCCGTGCTTAGGGTGCTAGGGTGACTAGGGTGGTAGGTGTATTAGGGTGATGAACTAGGGTGAGATTAGGGTGGCACGGACTAGGGTGCTGTAGGGTGTTAGGGTGTCACATAGGGTGTAGGGTGCTTAGGGTGATAACGTCCTAGGGTGAGTAGGGTGTATTTCCAAGTGCGGCAAATAGGGTGTAGGGTGGCTAGGGTGAACGTAGGGTGAGATAGGGTGTCACTTTAACTAGATAGGGTGTTAGGGTGCTTAGGGTGTAGGGTGTAGGGTGCTAGGGTGTAGGGTGTTAGGGTGGCCTCGTAGGGTGGGCTAGGGTGAATAGGGTGTAGGGTGGCTAGGGTGTTTAGGGTGTAGGGTGCTAGGGTGCTAGGGTGGTAGGGTGGACGTGATAGGGTGTAGTAGGGTGTTCTAGGGTGAAAGCTGCCTTAGGGTGCTTAGGGTGCGGGGTGTAGGGTGTAGGGTGTGCTAGGGTGAGATTCGTAGGGTGGTAGGGTGTAGGGTGAGTAGGGTGATAGGGTGTCGCAGCCGAACCTTTAGGGTGTAGGGTGAGTAGGGTGCTAGGGTGACTTGTAGGGTGTTGTTACGTAGGGTGTAGGGTGAATAGGGTGGAGTAGGGTGTTAGGGTGCTAGGGTGCTAGGGTGGTAGGGTGATAGGGTGTAGGGTGGTTATTCCTAGGGTGGTAGGGTGCTGCTTAGGGTGTTTTTAGGGTGAGCAGGTAGGGTGACGCTAGGGTGATAGGGTGAGCTAGGGTGTAGGGTGCACGCCTAGGGTGTTAGGGTGTAGGGTGGCGTAGGGTGCTAGGGTGGTAGGGTGCAATATAGGGTGTAGGGTGACAACCCCGCATAGGGTGCGGTCGCACTTATAGGGTGGGTAGGGTGCTCATAGGGTGTAGGGTGTAGGGTG'
            mer      : 'TAGGGTGTA'
            result   : {
              count     : 22,
              positions : [
                54, 84, 100, 224, 265, 291, 366, 373, 388, 435, 460, 505, 565,
                604, 650, 701, 767, 862, 890, 935, 999, 1006
              ]
            }
          }
        ]

        for test in tests
          sequence = _construct(test)
          result   = sequence.mer(test.mer)
          Assert.deepEqual(result, test.result)
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
          counts   = sequence.letterCounts()
          Assert.deepEqual(counts, test.counts)
    }

    'kMers': {
      'should return count of mers of length k': ()->
        tests = require('../data/SequenceTest.kMers.data')

        for test in tests
          sequence = _construct(test)
          kMers    = sequence.kMers(k: test.k)
          Assert.deepEqual(kMers, test.kMers)
    }

    'print' : {
      'should fuckn print' : ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : VibrioCholerae.oriC
            printed  : [
              'ATCAATGA TCAACGTA AGCTTCTA AGCATGAT CAAGGTGC TCACACAG TTTATCCA CAACCTGA',
              'GTGGATGA CATCAAGA TAGGTCGT TGTATCTC CTTCCTCT CGTACTCT CATGACCA CGGAAAGA',
              'TGATCAAG AGAGGATG ATTTCTTG GCCATATC GCAATGAA TACTTGTG ACTTGTGC TTCCAATT',
              'GACATCTT CAGCGCCA TATTGCGC TGGCCAAG GTGACGGA GCGGGATT ACGAAAGC ATGATCAT',
              'GGCTGTTG TTCTGTTT ATCTTGTT TTGACTGA GACTTGTT AGGATAGA CGGTTTTT CATCACTG',
              'ACTAGCCA AAGCCTTA CTCTGCCT GACATCGA CCGTAAAT TGATAATG AATTTACA TGCTTCCG',
              'CGACGATT TACCTCTT GATCATCG ATCCGATT GAAGATCT TCAATTGT TAATTCTC TTGCCTCG',
              'ACTCATAG CCATGATG AGCTCTTG ATCATGTT TCCTTAAC CCTCTATT TTTTACGG AAGAATGA',
              'TCAAGCTG CTGCTCTT GATCATCG TTTC'
            ].join('\n')
          }
          {
            Type     : Bioi.Dna
            sequence : 'AGCTTCAGTTTCCDTATTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAGCGCGCGCGCTA'
            printed  : """
              AGCTTCAG TTTCCDTA TTTCATTC TGACTGCA ACGGGCAA TATGTCTC TGTGTGGA TTAAAAAA
              GCGCGCGC GCTA
            """
          }
        ]

        for test in tests
          sequence = _construct(test)
          printed = sequence.print()
          Assert.equal(printed, test.printed)
    }
  }
}
