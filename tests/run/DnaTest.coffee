Assert = require('assert')

Bioi = require('../../')

module.exports = {
  'Dna': {
    'complement': {
      'should complement': ()->
        tests = {
          'AAAA'               : 'TTTT'
          'ACGT'               : 'ACGT'
          'ACTGATCGATTCAGTCAG' : 'CTGACTGAATCGATCAGT'
          'TTGTGTC'            : 'GACACAA'
          'AGTCGCATAGT'        : 'ACTATGCGACT'
          'AAAACCCGGT'         : 'ACCGGGTTTT'
          'ACACAC'             : 'GTGTGT'
          """
          AGCGAACTTAGAGGGCGGC
          GTGCGCTTACGAACTTAGA
          GGGCCTTAGTGCGCTTACG
          GCATTCGCGTGATTCCGGG
          AGATTCAAGCATTCGCGTG
          CGGCGGGAGATTCAAGCGA
          """                  : "TCGCTTGAATCTCCCGCCGCACGCGAATGCTTGAATCTCCCGGAATCACGCGAATGCCGTAAGCGCACTAAGGCCCTCTAAGTTCGTAAGCGCACGCCGCCCTCTAAGTTCGCT"
        }

        for sequence, complement of tests
          dna = new Bioi.Dna(sequence : sequence)
          Assert.equal(dna.complement(), complement)
    }

    'skews' : {
      'should calculate skew or sequence by index' : ()->
        tests = {
          CATGGGCATCGGCCATACGCC : [0, -1, -1, -1, 0, 1, 2, 1, 1, 1, 0, 1, 2, 1, 0, 0, 0, 0, -1, 0, -1, -2]
        }

        for sequence, skews of tests
          dna = new Bioi.Dna(sequence : sequence)
          Assert.deepEqual(dna.skews(), skews)
    }

    'minimumSkew' : {
      'should return indexes where skew is minimized' : ()->
        tests = {
          TAAAGACTGCCGAGAGGCCAACACGAGTGCTAGAACGAGGGGCGTAAACGCGGGTCCGAT : [11, 24]
          ACCG     : [3]
          ACCC     : [4]
          CCGGGT   : [2]
          CCGGCCGG : [2, 6]
        }

        for sequence, min_skew of tests
          dna = new Bioi.Dna(sequence : sequence)
          Assert.deepEqual(dna.minimumSkew(), min_skew)
    }
  }
}
