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


    '@converter' : {
      'should properly convert between mer and number': ()->
        tests = {
          AA       : 0
          TT       : 15
          GT       : 11
          CC       : 5
          AAA      : 0
          TTT      : 63
          ATGCAA   : 912
          CCCATTC  : 5437
          ACCCATTC : 5437
        }

        for mer, num of tests
          converter = Bioi.Dna.converter(length : mer.length)
          Assert.equal(converter.merToNum(mer), num)
          Assert.equal(converter.numToMer(num), mer)

      'should properly invert' : ()->
        mer       = 'ACTGAGTCGTGAGGATATATAGGGAACCCATGGAGAGTCATACATAATATATATCGAGATATAGATACA'
        converter = Bioi.Dna.converter(length : mer.length)
        num       = converter.merToNum(mer)
        inverted  = converter.numToMer(num)

        Assert.equal(mer, inverted)
    }


    'clumps' : {
      'should return mers matching specified args': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'gatcagcataagggtccCTGCAATGCATGACAAGCCTGCAGTtgtttta'
            window   : 25
            times    : 3
            length   : 4
            clumps   : ['TGCA']
          }
          {
            Type     : Bioi.Dna
            sequence : VibrioCholerae.sequence
            window   : 500
            times    : 3
            length   : 9
            clumps   : [
              'AAAAACTGA',
              'AAACTCAAA',
              'AAATAAAAA',
              'AAATAAATA',
              'AACAGCAAC',
              'AAGCATGAT',
              'AAGGTGGTC',
              'AAGTCAGGT',
              'ACAGCAACA',
              'ACTCACACT',
              'AGAGAGAGA',
              'AGCAACAAG',
              'AGCAACAGC',
              'AGCATGATC',
              'AGGGGGTAT',
              'AGGTAAGTC',
              'AGGTTGGGA',
              'AGTCAGGTA',
              'ATAAACAAT',
              'ATGATCAAG',
              'ATGCCGAGT',
              'ATGTTATTG',
              'ATTGCGGAT',
              'ATTGGGACT',
              'ATTTTTGAT',
              'CAAAACCCT',
              'CAACAACAA',
              'CAACAGCAA',
              'CACACACAC',
              'CACCAAACT',
              'CACGCGTTG',
              'CAGCAACAA',
              'CAGCAACAG',
              'CAGGTAAGT',
              'CATGATCAT',
              'CCCCCCCCC',
              'CCCCCTTAT',
              'CCCCTTATA',
              'CCCTTATAG',
              'CCTCCCCCT',
              'CCTTATAGG',
              'CGCCAGATG',
              'CGGATGTTA',
              'CGTGGTGGT',
              'CGTGTTTGC',
              'CTATAAACA',
              'CTCCCCCTT',
              'CTCTTGATC',
              'CTGGTTCTG',
              'CTTAAAGAT',
              'CTTATAGGG',
              'CTTGATCAT',
              'GAAGGCATC',
              'GAAGGTGGT',
              'GAGAGAGAG',
              'GAGGGGGTA',
              'GAGGTTGGG',
              'GATGTTATT',
              'GATTTTTGA',
              'GCAACAGCA',
              'GCAGCAACA',
              'GCATGATCA',
              'GCCGAGTAA',
              'GCGGATGTT',
              'GCTTTCAGC',
              'GGAGGGGGT',
              'GGAGGTTGG',
              'GGATGTTAT',
              'GGGAGGGGG',
              'GGGAGGTTG',
              'GGGGAGGTT',
              'GGGGGGGGG',
              'GGGGGTATT',
              'GGGGTATTT',
              'GGGTATTTC',
              'GGTAAGTCA',
              'GGTATTTCG',
              'GGTGGTCGT',
              'GGTTCTGGT',
              'GGTTGGGAG',
              'GTAAGTCAG',
              'GTATTTCGC',
              'GTCAGGTAA',
              'GTTATTGCG',
              'GTTCTGGTT',
              'GTTGGGAGG',
              'TAAAGATTC',
              'TAAGTCAGG',
              'TATAAACAA',
              'TATTGCGGA',
              'TCACCAATC',
              'TCAGGTAAG',
              'TCCACACAA',
              'TCCCCCTTA',
              'TCGTCGTGA',
              'TCTATAAAC',
              'TCTGGTTCT',
              'TCTTGATCA',
              'TCTTTTTCA',
              'TGATTTTCA',
              'TGATTTTTG',
              'TGCCGAGTA',
              'TGCGGATGT',
              'TGGGAGGGG',
              'TGGTCCCAT',
              'TGGTTCTGG',
              'TGTTATTGC',
              'TTACTGTGT',
              'TTATAGGGG',
              'TTATCGGTT',
              'TTATTGCGG',
              'TTCTGGTTC',
              'TTGATTTTT',
              'TTGCATTTT',
              'TTGCGGATG',
              'TTGGGAGGG',
              'TTGGTCCCA',
              'TTGTAAAAT',
              'TTTGATTTT',
              'TTTGCATTT',
              'TTTGGTCCC',
              'TTTGGTTTC',
              'TTTTGATTT',
              'TTTTTGATT'
            ]
          }
        ]

        for test in tests
          sequence = _construct(test)
          clumps   = sequence.clumps(test)
          Assert.deepEqual(clumps, test.clumps)
    }

    'frequencyArray' : {
      'should return expected frequency array': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACGCGGCTCTGAAA'
            length   : 2
            freqs    : [2, 1, 0, 0, 0, 0, 2, 2, 1, 2, 1, 0, 0, 1, 1, 0]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAAC'
            length   : 2
            freqs    : [3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          }
          {
            Type     : Bioi.Dna
            sequence : 'TTAAA'
            length   : 2
            freqs    : [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAA'
            length   : 2
            freqs    : [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          }
        ]

        for test in tests
          sequence = _construct(test)
          freqs    = sequence.frequencyArray(length: test.length)
          Assert.deepEqual(freqs, test.freqs)
    }

    'letterCounts' : {
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
    }


    'mers' : {
      'should return frequent mers of length arg': ()->
        tests = require('../data/SequenceTest.mers.data')

        for test in tests
          sequence = _construct(test)
          mers     = sequence.mers(length: test.length)
          Assert.deepEqual(mers, test.mers)
    }


    'mersSort' : {
      'should return frequent mers of length arg': ()->
        tests = require('../data/SequenceTest.mers.data')

        for test in tests
          sequence = _construct(test)
          result   = sequence.mersSort(length: test.length)
          Assert.deepEqual(result, test.mers.max)
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
