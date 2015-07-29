Assert = require('assert')

Bioi = require('../../')

module.exports = {
  'Dna': {
    'complement': {
      'should complement': ()->
        inputs = {
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

        for sequence, complement of inputs
          dna = new Bioi.Dna(sequence : sequence)
          Assert.equal(dna.complement(), complement)
    }
  }
}
