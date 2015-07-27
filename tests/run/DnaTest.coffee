Assert = require('assert')

Bioi = require('../../')

module.exports = {
  'Dna': {
    'complement': {
      'should complement': ()->
        inputs = {
          'AAAA'               : 'TTTT'
          'ACGT'               : 'TGCA'
          'ACTGATCGATTCAGTCAG' : 'TGACTAGCTAAGTCAGTC'
          'TTGTGTC'            : 'AACACAG'
        }

        for sequence, complement of inputs
          dna = new Bioi.Dna(sequence : sequence)
          Assert.equal(dna.complement(), complement)
    }
  }
}
