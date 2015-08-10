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


    '@neighbors' : {
      'should return mers within <distance> of <pattern>' : ()->
        tests = [
          {
            mer      : 'ACG'
            distance : 1
            result   : [
              'AAG'
              'ACA'
              'ACC'
              'ACG'
              'ACT'
              'AGG'
              'ATG'
              'CCG'
              'GCG'
              'TCG'
            ]
          }
          {
            mer      : 'AAA'
            distance : 3
            result   : [
              'AAA'
              'AAC'
              'AAG'
              'AAT'
              'ACA'
              'ACC'
              'ACG'
              'ACT'
              'AGA'
              'AGC'
              'AGG'
              'AGT'
              'ATA'
              'ATC'
              'ATG'
              'ATT'
              'CAA'
              'CAC'
              'CAG'
              'CAT'
              'CCA'
              'CCC'
              'CCG'
              'CCT'
              'CGA'
              'CGC'
              'CGG'
              'CGT'
              'CTA'
              'CTC'
              'CTG'
              'CTT'
              'GAA'
              'GAC'
              'GAG'
              'GAT'
              'GCA'
              'GCC'
              'GCG'
              'GCT'
              'GGA'
              'GGC'
              'GGG'
              'GGT'
              'GTA'
              'GTC'
              'GTG'
              'GTT'
              'TAA'
              'TAC'
              'TAG'
              'TAT'
              'TCA'
              'TCC'
              'TCG'
              'TCT'
              'TGA'
              'TGC'
              'TGG'
              'TGT'
              'TTA'
              'TTC'
              'TTG'
              'TTT'
            ]
          }
          {
            mer      : 'A'
            distance : 1000
            result   : ['A', 'C', 'G', 'T']
          }
          {
            mer      : 'AA'
            distance : 1
            result   : [
              'AA'
              'AC'
              'AG'
              'AT'
              'CA'
              'GA'
              'TA'
            ]
          }
          {
            mer      : 'AA'
            distance : 2
            result   : [
              'AA'
              'AC'
              'AG'
              'AT'
              'CA'
              'CC'
              'CG'
              'CT'
              'GA'
              'GC'
              'GG'
              'GT'
              'TA'
              'TC'
              'TG'
              'TT'
            ]
          }
          {
            mer      : 'AA'
            distance : 0
            result   : [
              'AA'
            ]
          }
        ]

        for test in tests
          neighbors = Bioi.Dna.neighbors(test).sort()
          Assert.deepEqual(neighbors, test.result)

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
            result   : ['TGCA']
          }
          {
            Type     : Bioi.Dna
            sequence : VibrioCholerae.sequence
            window   : 500
            times    : 3
            length   : 9
            result   : [
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

        tests.pop()
        for test in tests
          sequence = _construct(test)
          clumps   = sequence.clumps(test)
          Assert.deepEqual(clumps, test.result)
    }


    'frequencyArray' : {
      'should return expected frequency array': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACGCGGCTCTGAAA'
            length   : 2
            result   : [2, 1, 0, 0, 0, 0, 2, 2, 1, 2, 1, 0, 0, 1, 1, 0]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAAC'
            length   : 2
            result   : [3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          }
          {
            Type     : Bioi.Dna
            sequence : 'TTAAA'
            length   : 2
            result   : [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAA'
            length   : 2
            result   : [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
          }
        ]

        for test in tests
          sequence = _construct(test)
          freqs    = sequence.frequencyArray(length: test.length)
          Assert.deepEqual(freqs, test.result)
    }

    'hammingDistance' : {
        'should calculate the distance between two sequences' : ()->
          tests = [
            {
              Type       : Bioi.Dna
              sequence_a : 'GGGCCGTTGGT'
              sequence_b : 'GGACCGTTGAC'
              result     : 3
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'AAAA'
              sequence_b : 'TTTT'
              result     : 4
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'ACGTACGT'
              sequence_b : 'TACGTACG'
              result     : 8
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'ACGTACGT'
              sequence_b : 'CCCCCCCC'
              result     : 6
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'ACGTACGT'
              sequence_b : 'TGCATGCA'
              result     : 8
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'GATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAAATTTTATTGACTTAGGTCACTAAATACT'
              sequence_b : 'AATAGCAGCTTCTCAACTGGTTACCTCGTATGAGTAAATTAGGTCATTATTGACTCAGGTCACTAACGTCT'
              result     : 15
            }
            {
              Type       : Bioi.Dna
              sequence_a : 'AGAAACAGACCGCTATGTTCAACGATTTGTTTTATCTCGTCACCGGGATATTGCGGCCACTCATCGGTCAGTTGATTACGCAGGGCGTAAATCGCCAGAATCAGGCTG'
              sequence_b : 'AGAAACCCACCGCTAAAAACAACGATTTGCGTAGTCAGGTCACCGGGATATTGCGGCCACTAAGGCCTTGGATGATTACGCAGAACGTATTGACCCAGAATCAGGCTC'
              result     : 28
            }
          ]

          for test in tests
            sequence_a = new test.Type(sequence : test.sequence_a)
            sequence_b = new test.Type(sequence : test.sequence_b)

            for distance in [
              sequence_a.hammingDistance(sequence_b)
              sequence_b.hammingDistance(sequence_a)
              sequence_a.hammingDistance(test.sequence_b)
              sequence_b.hammingDistance(test.sequence_a)
            ]
              Assert.equal(distance, test.result)
    }


    'letterCounts' : {
      'should return counts of letters': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACTGAAATTCTGAGGCT'
            result   : {
              A : 5
              C : 3
              T : 5
              G : 4
            }
          }
          {
            Type     : Bioi.Dna
            sequence : 'TTTTTT'
            result   : {
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
            result   : {
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
          Assert.deepEqual(counts, test.result)
    }

    'mer': {
      'should return positions of mer': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACAACTATGCATACTATCGGGAACTATCCT'
            mer      : 'ACTAT'
            result   : [ 3, 12, 22 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'CGATATATCCATAG'
            mer      : 'ATA'
            result   : [ 2, 4, 10 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'ACTGTACGATGATGTGTGTCAAAG'
            mer      : 'TGT'
            result   : [ 2, 12, 14, 16 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'GCGCG'
            mer      : 'GCG'
            result   : [ 0, 2 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'ACGTACGTACGT'
            mer      : 'CG'
            result   : [ 1, 5, 9 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAGAGTGTCTGATAGCAGCTTCTGAACTGGTTACCTGCCGTGAGTAAATTAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAATATAGGCATAGCGCACAGACAGATAATAATTACAGAGTACACAACATCCAT'
            mer      : 'AAA'
            result   : [ 0, 46, 51, 74 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AGCGTGCCGAAATATGCCGCCAGACCTGCTGCGGTGGCCTCGCCGACTTCACGGATGCCAAGTGCATAGAGGAAGCGAGCAAAGGTGGTTTCTTTCGCTTTATCCAGCGCGTTAACCACGTTCTGTGCCGACTTT'
            mer      : 'TTT'
            result   : [ 88, 92, 98, 132 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'GGACTTACTGACGTACG'
            mer      : 'ACT'
            result   : [ 2, 6 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'ATCCGATCCCATGCCCATG'
            mer      : 'CC'
            result   : [ 2, 7, 8, 13, 14 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'CTGTTTTTGATCCATGATATGTTATCTCTCCGTCATCAGAAGAACAGTGACGGATCGCCCTCTCTCTTGGTCAGGCGACCGTTTGCCATAATGCCCATGCTTTCCAGCCAGCTCTCAAACTCCGGTGACTCGCGCAGGTTGAGTA'
            mer      : 'CTC'
            result   : [ 25, 27, 59, 61, 63, 111, 113, 119, 128 ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'TAGGGTGTCATTGTAGGGTGAACGTTTAGGGTGCCTAGGGTGGACTTAGGGTGCTAGGGTGTAGGGTGTTAGGGTGTTTGGGGGTAGGGTGTAGGGTGCGTAGGGTGTAGGGTGCCGTGCTTAGGGTGCTAGGGTGACTAGGGTGGTAGGTGTATTAGGGTGATGAACTAGGGTGAGATTAGGGTGGCACGGACTAGGGTGCTGTAGGGTGTTAGGGTGTCACATAGGGTGTAGGGTGCTTAGGGTGATAACGTCCTAGGGTGAGTAGGGTGTATTTCCAAGTGCGGCAAATAGGGTGTAGGGTGGCTAGGGTGAACGTAGGGTGAGATAGGGTGTCACTTTAACTAGATAGGGTGTTAGGGTGCTTAGGGTGTAGGGTGTAGGGTGCTAGGGTGTAGGGTGTTAGGGTGGCCTCGTAGGGTGGGCTAGGGTGAATAGGGTGTAGGGTGGCTAGGGTGTTTAGGGTGTAGGGTGCTAGGGTGCTAGGGTGGTAGGGTGGACGTGATAGGGTGTAGTAGGGTGTTCTAGGGTGAAAGCTGCCTTAGGGTGCTTAGGGTGCGGGGTGTAGGGTGTAGGGTGTGCTAGGGTGAGATTCGTAGGGTGGTAGGGTGTAGGGTGAGTAGGGTGATAGGGTGTCGCAGCCGAACCTTTAGGGTGTAGGGTGAGTAGGGTGCTAGGGTGACTTGTAGGGTGTTGTTACGTAGGGTGTAGGGTGAATAGGGTGGAGTAGGGTGTTAGGGTGCTAGGGTGCTAGGGTGGTAGGGTGATAGGGTGTAGGGTGGTTATTCCTAGGGTGGTAGGGTGCTGCTTAGGGTGTTTTTAGGGTGAGCAGGTAGGGTGACGCTAGGGTGATAGGGTGAGCTAGGGTGTAGGGTGCACGCCTAGGGTGTTAGGGTGTAGGGTGGCGTAGGGTGCTAGGGTGGTAGGGTGCAATATAGGGTGTAGGGTGACAACCCCGCATAGGGTGCGGTCGCACTTATAGGGTGGGTAGGGTGCTCATAGGGTGTAGGGTGTAGGGTG'
            mer      : 'TAGGGTGTA'
            result   : [ 54, 84, 100, 224, 265, 291, 366, 373, 388, 435, 460, 505, 565, 604, 650, 701, 767, 862, 890, 935, 999, 1006 ]
          }
        ]

        for test in tests
          sequence = _construct(test)
          result   = sequence.mer(mer : test.mer)
          Assert.deepEqual(result, test.result)
    }


    'merApproximate' : {
      'should find all approximate occurences of mer in a string' : ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'CGCCCGAATCCAGAACGCATTCCCATATTTCGGGACCACTGGCCTCCACGGTACGGACGTCAATCAAAT'
            mer      : 'ATTCTGGA'
            distance : 3
            result   : [6, 7, 26, 27]
          }
          {
            Type     : Bioi.Dna
            sequence : 'TTTTTTAAATTTTAAATTTTTT'
            mer      : 'AAA'
            distance : 2
            result   : [4, 5, 6, 7, 8, 11, 12, 13, 14, 15]
          }
          {
            Type     : Bioi.Dna
            sequence : 'GAGCGCTGGGTTAACTCGCTACTTCCCGACGAGCGCTGTGGCGCAAATTGGCGATGAAACTGCAGAGAGAACTGGTCATCCAACTGAATTCTCCCCGCTATCGCATTTTGATGCGCGCCGCGTCGATT'
            mer      : 'GAGCGCTGG'
            distance : 2
            result   : [0, 30, 66]
          }
          {
            Type     : Bioi.Dna
            sequence : 'CCAAATCCCCTCATGGCATGCATTCCCGCAGTATTTAATCCTTTCATTCTGCATATAAGTAGTGAAGGTATAGAAACCCGTTCAAGCCCGCAGCGGTAAAACCGAGAACCATGATGAATGCACGGCGATTGCGCCATAATCCAAACA'
            mer      : 'AATCCTTTCA'
            distance : 3
            result   : [3, 36, 74, 137]
          }
          {
            Type     : Bioi.Dna
            sequence : 'CCGTCATCCGTCATCCTCGCCACGTTGGCATGCATTCCGTCATCCCGTCAGGCATACTTCTGCATATAAGTACAAACATCCGTCATGTCAAAGGGAGCCCGCAGCGGTAAAACCGAGAACCATGATGAATGCACGGCGATTGC'
            mer      : 'CCGTCATCC'
            distance : 3
            result   : [0, 7, 36, 44, 48, 72, 79, 112]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAAAA'
            mer      : 'TTT'
            distance : 3
            result   : [0, 1, 2, 3]
          }
          {
            Type     : Bioi.Dna
            sequence : 'CCACCT'
            mer      : 'CCA'
            distance : 0
            result   : [0]
          }
        ]

        for test in tests
          sequence = _construct(test)
          result   = sequence.merApproximate(
            mer      : test.mer
            distance : test.distance
          )
          Assert.deepEqual(result, test.result)
    }


    'merApproximateCount' : {
      'should return count of approximate mers': ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'TTTAGAGCCTTCAGAGG'
            mer      : 'GAGG'
            distance : 2
            result   : 4
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAA'
            mer      : 'AA'
            distance : 0
            result   : 2
          }
          {
            Type     : Bioi.Dna
            sequence : 'ATA'
            mer      : 'ATA'
            distance : 1
            result   : 1
          }
        ]

        for test in tests
          sequence = _construct(test)
          count    = sequence.merApproximateCount(
            mer      : test.mer
            distance : test.distance
          )
          Assert.equal(count, test.result)
    }


    'mers' : {
      'should return frequent mers of length arg': ()->
        tests = require('../data/SequenceTest.mers.data')

        for test in tests
          sequence = _construct(test)
          result   = sequence.mers(length: test.length)
          result.max.mers.sort()
          Assert.deepEqual(result, test.result)
    }


    'mersApproximate' : {
      'should return derp' : ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : 'ACGTTGCATGTCGCATGATGCATGAGAGCT'
            length   : 4
            distance : 1
            result   : [
              'GATG',
              'ATGC',
              'ATGT',
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAAAAAAAAA'
            length   : 2
            distance : 1
            result   : [
              'AA'
              'AC'
              'TA'
              'AG'
              'AT'
              'CA'
              'GA'
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AGTCAGTC'
            length   : 4
            distance : 2
            result   : [
              'TCTC'
              'CGGC'
              'AAGC'
              'TGTG'
              'GGCC'
              'AGGT'
              'ATCC'
              'ACTG'
              'ACAC'
              'AGAG'
              'ATTA'
              'TGAC'
              'AATT'
              'CGTT'
              'GTTC'
              'GGTA'
              'AGCA'
              'CATC'
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AATTAATTGGTAGGTAGGTA'
            length   : 4
            distance : 0
            result   : [
              'GGTA'
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'ATA'
            length   : 3
            distance : 1
            result   : [
              'GTA'
              'ACA'
              'AAA'
              'ATC'
              'ATA'
              'AGA'
              'ATT'
              'CTA'
              'TTA'
              'ATG'
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'AAT'
            length   : 3
            distance : 0
            result   : [
              'AAT'
            ]
          }
          {
            Type     : Bioi.Dna
            sequence : 'TAGCG'
            length   : 2
            distance : 1
            result   : [
              'GG'
              'TG'
            ]
          }
        ]

        for test in tests
          sequence = _construct(test)
          result   = sequence.mersApproximate(test)
          Assert.deepEqual(result.max.mers.sort(), test.result.sort())
    }


    'mersSort' : {
      'should return frequent mers of length arg': ()->
        tests = require('../data/SequenceTest.mers.data')

        for test in tests
          sequence = _construct(test)
          result   = sequence.mersSort(length: test.length)
          # sort the arrays so deepEqual works
          result.max.mers.sort()
          test.result.max.mers.sort()
          Assert.deepEqual(result, test.result)
    }


    'print' : {
      'should fuckn print' : ()->
        tests = [
          {
            Type     : Bioi.Dna
            sequence : VibrioCholerae.oriC
            result   : [
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
            result   : """
              AGCTTCAG TTTCCDTA TTTCATTC TGACTGCA ACGGGCAA TATGTCTC TGTGTGGA TTAAAAAA
              GCGCGCGC GCTA
            """
          }
        ]

        for test in tests
          sequence = _construct(test)
          printed = sequence.print()
          Assert.equal(printed, test.result)
    }
  }
}
