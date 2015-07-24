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

# d1 = new DNA("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
# # {A: 20, C: 12, T: 17, G: 21}
# console.log(d1.counts())
#
# d2 = new DNA("TGACAAGGCTGACAAGGCTGACAAGGCTTTGTACCCTGACAAGGCCTCGCACCAGTTTGTACCCTTTGTACCCTTTGTACCCAGATTTGACTTTTGTACCCCGTAGTGCGCCGTAGTGCGCTGACAAGGCAGATTTGACTCGTAGTGCGCCGTAGTGCGCTGACAAGGCCGTAGTGCGCAGATTTGACTTGACAAGGCCTCGCACCAGAGATTTGACTAGATTTGACTAGATTTGACTTGACAAGGCCGTAGTGCGCTTTGTACCCCGTAGTGCGCCGTAGTGCGCCTCGCACCAGCGTAGTGCGCTGACAAGGCCTCGCACCAGAGATTTGACTTTTGTACCCCGTAGTGCGCTGACAAGGCTGACAAGGCTGACAAGGCTTTGTACCCCTCGCACCAGAGATTTGACTCTCGCACCAGTTTGTACCCAGATTTGACTTGACAAGGCTTTGTACCCAGATTTGACTTGACAAGGCCTCGCACCAGAGATTTGACTCGTAGTGCGCTTTGTACCCAGATTTGACTCGTAGTGCGCCTCGCACCAGTGACAAGGCAGATTTGACTAGATTTGACTTTTGTACCCTGACAAGGCTGACAAGGCTGACAAGGCCTCGCACCAGTTTGTACCCTGACAAGGCCGTAGTGCGCAGATTTGACTCGTAGTGCGCAGATTTGACTCGTAGTGCGCCTCGCACCAGTTTGTACCCCTCGCACCAGTTTGTACCCTGACAAGGCTGACAAGGCAGATTTGACTCTCGCACCAGCTCGCACCAGCGTAGTGCGCAGATTTGACTAGATTTGACTCGTAGTGCGCAGATTTGACTCTCGCACCAGTGACAAGGCTGACAAGGCAGATTTGACTTTTGTACCCCGTAGTGCGCTTTGTACCCTGACAAGGC")
# console.log(d2.frequentMers(11).sort().join(" "))

module.exports = {
  'Dna': {
    'constructor': {
      'should construct': ()->
        sequence = 'ACTGATCGATTCAGTCAG'
        dna = new Bioi.Dna(sequence : sequence)
        Assert.equal(sequence, dna.sequence)
    }

    'count': {
      'should return count of mers': ()->
        dna = new Bioi.Dna(sequence : 'ACAACTATGCATACTATCGGGAACTATCCT')
        Assert.equal(dna.count('ACTAT'), 3)

        dna = new Bioi.Dna(sequence : 'CGATATATCCATAG')
        Assert.equal(dna.count('ATA'), 3)
    }
  }
}
