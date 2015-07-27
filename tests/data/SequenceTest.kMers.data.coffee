Bioi = require('../../')
vibrioCholeraeOriC = require('./vibrioCholeraeOriC')

module.exports = [
  {
    Type     : Bioi.Dna
    sequence : 'ACTG'
    k        : 1
    kMers    : {
      all : {
        A : 1
        C : 1
        T : 1
        G : 1
      }
      max : {
        count : 1
        mers : ['A', 'C', 'T', 'G']
      }
    }
  }
  {
    Type     : Bioi.Dna
    sequence : 'CGATATATCCATAG'
    k        : 3
    kMers    : {
      all: {
        ATA: 3
        ATC: 1
        CAT: 1
        CCA: 1
        CGA: 1
        GAT: 1
        TAG: 1
        TAT: 2
        TCC: 1
      }
      max: {
        count: 3
        mers: [
          'ATA'
        ]
      }
    }
  }
  {
    Type     : Bioi.Dna
    sequence : 'ACAACTATGCATACTATCGGGAACTATCCT'
    k        : 5
    kMers    : {
      all: {
        AACTA: 2
        ACAAC: 1
        ACTAT: 3
        ATACT: 1
        ATCCT: 1
        ATCGG: 1
        ATGCA: 1
        CAACT: 1
        CATAC: 1
        CGGGA: 1
        CTATC: 2
        CTATG: 1
        GAACT: 1
        GCATA: 1
        GGAAC: 1
        GGGAA: 1
        TACTA: 1
        TATCC: 1
        TATCG: 1
        TATGC: 1
        TCGGG: 1
        TGCAT: 1
      }
      max: {
        count: 3
        mers: [
          'ACTAT'
        ]
      }
    }
  }
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
    k     : 11
    kMers : {
      all: {
        AAAAAAAGAGT: 1
        AAAAAAGAGTG: 1
        AAAAAGAGTGT: 1
        AAAAGAGTGTC: 1
        AAAGAGTGTCT: 1
        AACGGGCAATA: 1
        AAGAGTGTCTG: 1
        AAGGCAGATTT: 4
        AAGGCCGTAGT: 3
        AAGGCCTCGCA: 5
        AAGGCTGACAA: 8
        AAGGCTTTGTA: 3
        AATATGTCTCT: 1
        ACAAGGCAGAT: 4
        ACAAGGCCGTA: 3
        ACAAGGCCTCG: 5
        ACAAGGCTGAC: 8
        ACAAGGCTTTG: 3
        ACCAGAGATTT: 4
        ACCAGCGTAGT: 2
        ACCAGCTCGCA: 1
        ACCAGTGACAA: 2
        ACCAGTTTGTA: 5
        ACCCAGATTTG: 4
        ACCCCGTAGTG: 4
        ACCCCTCGCAC: 2
        ACCCTGACAAG: 5
        ACCCTTTGTAC: 2
        ACGGGCAATAT: 1
        ACTAGATTTGA: 4
        ACTCGTAGTGC: 6
        ACTCTCGCACC: 3
        ACTGCAACGGG: 1
        ACTTGACAAGG: 4
        ACTTTTGTACC: 4
        AGAGATTTGAC: 4
        AGAGTGTCTGA: 1
        AGATTTGACTA: 4
        AGATTTGACTC: 9
        AGATTTGACTT: 8
        AGCAGCTGACA: 1
        AGCGTAGTGCG: 2
        AGCTCGCACCA: 1
        AGCTGACAAGG: 1
        AGCTTTTCATT: 1
        AGGCAGATTTG: 4
        AGGCCGTAGTG: 3
        AGGCCTCGCAC: 5
        AGGCTGACAAG: 8
        AGGCTTTGTAC: 3
        AGTGACAAGGC: 2
        AGTGCGCAGAT: 5
        AGTGCGCCGTA: 3
        AGTGCGCCTCG: 3
        AGTGCGCTGAC: 4
        AGTGCGCTTTG: 3
        AGTGTCTGATA: 1
        AGTTTGTACCC: 5
        ATAGCAGCTGA: 1
        ATATGTCTCTG: 1
        ATGTCTCTGTG: 1
        ATTAAAAAAAG: 1
        ATTCTGACTGC: 1
        ATTTGACTAGA: 4
        ATTTGACTCGT: 6
        ATTTGACTCTC: 3
        ATTTGACTTGA: 4
        ATTTGACTTTT: 4
        CAACGGGCAAT: 1
        CAAGGCAGATT: 4
        CAAGGCCGTAG: 3
        CAAGGCCTCGC: 5
        CAAGGCTGACA: 8
        CAAGGCTTTGT: 3
        CAATATGTCTC: 1
        CACCAGAGATT: 4
        CACCAGCGTAG: 2
        CACCAGCTCGC: 1
        CACCAGTGACA: 2
        CACCAGTTTGT: 5
        CAGAGATTTGA: 4
        CAGATTTGACT: 13
        CAGCGTAGTGC: 2
        CAGCTCGCACC: 1
        CAGCTGACAAG: 1
        CAGTGACAAGG: 2
        CAGTTTGTACC: 5
        CATTCTGACTG: 1
        CCAGAGATTTG: 4
        CCAGATTTGAC: 4
        CCAGCGTAGTG: 2
        CCAGCTCGCAC: 1
        CCAGTGACAAG: 2
        CCAGTTTGTAC: 5
        CCCAGATTTGA: 4
        CCCCGTAGTGC: 4
        CCCCTCGCACC: 2
        CCCGTAGTGCG: 4
        CCCTCGCACCA: 2
        CCCTGACAAGG: 5
        CCCTTTGTACC: 2
        CCGTAGTGCGC: 10
        CCTCGCACCAG: 10
        CCTGACAAGGC: 5
        CCTTTGTACCC: 2
        CGCACCAGAGA: 4
        CGCACCAGCGT: 2
        CGCACCAGCTC: 1
        CGCACCAGTGA: 2
        CGCACCAGTTT: 5
        CGCAGATTTGA: 5
        CGCCGTAGTGC: 3
        CGCCTCGCACC: 3
        CGCTGACAAGG: 4
        CGCTTTGTACC: 3
        CGGGCAATATG: 1
        CGTAGTGCGCA: 5
        CGTAGTGCGCC: 6
        CGTAGTGCGCT: 7
        CTAGATTTGAC: 4
        CTCGCACCAGA: 4
        CTCGCACCAGC: 3
        CTCGCACCAGT: 7
        CTCGTAGTGCG: 6
        CTCTCGCACCA: 3
        CTCTGTGTGGA: 1
        CTGACAAGGCA: 3
        CTGACAAGGCC: 5
        CTGACAAGGCT: 9
        CTGACTGCAAC: 1
        CTGATAGCAGC: 1
        CTGCAACGGGC: 1
        CTGTGTGGATT: 1
        CTTGACAAGGC: 4
        CTTTGTACCCA: 3
        CTTTGTACCCC: 2
        CTTTGTACCCT: 3
        CTTTTCATTCT: 1
        CTTTTGTACCC: 4
        GACAAGGCAGA: 4
        GACAAGGCCGT: 3
        GACAAGGCCTC: 5
        GACAAGGCTGA: 8
        GACAAGGCTTT: 3
        GACTAGATTTG: 4
        GACTCGTAGTG: 6
        GACTCTCGCAC: 3
        GACTGCAACGG: 1
        GACTTGACAAG: 4
        GACTTTTGTAC: 4
        GAGATTTGACT: 4
        GAGTGTCTGAT: 1
        GATAGCAGCTG: 1
        GATTAAAAAAA: 1
        GATTTGACTAG: 4
        GATTTGACTCG: 6
        GATTTGACTCT: 3
        GATTTGACTTG: 4
        GATTTGACTTT: 4
        GCAACGGGCAA: 1
        GCAATATGTCT: 1
        GCACCAGAGAT: 4
        GCACCAGCGTA: 2
        GCACCAGCTCG: 1
        GCACCAGTGAC: 2
        GCACCAGTTTG: 5
        GCAGATTTGAC: 9
        GCAGCTGACAA: 1
        GCCGTAGTGCG: 6
        GCCTCGCACCA: 8
        GCGCAGATTTG: 5
        GCGCCGTAGTG: 3
        GCGCCTCGCAC: 3
        GCGCTGACAAG: 4
        GCGCTTTGTAC: 3
        GCGTAGTGCGC: 2
        GCTCGCACCAG: 1
        GCTGACAAGGC: 13
        GCTTTGTACCC: 6
        GCTTTTCATTC: 1
        GGATTAAAAAA: 1
        GGCAATATGTC: 1
        GGCAGATTTGA: 4
        GGCCGTAGTGC: 3
        GGCCTCGCACC: 5
        GGCTGACAAGG: 8
        GGCTTTGTACC: 3
        GGGCAATATGT: 1
        GTACCCAGATT: 4
        GTACCCCGTAG: 4
        GTACCCCTCGC: 2
        GTACCCTGACA: 5
        GTACCCTTTGT: 2
        GTAGTGCGCAG: 5
        GTAGTGCGCCG: 3
        GTAGTGCGCCT: 3
        GTAGTGCGCTG: 4
        GTAGTGCGCTT: 3
        GTCTCTGTGTG: 1
        GTCTGATAGCA: 1
        GTGACAAGGCA: 1
        GTGACAAGGCT: 1
        GTGCGCAGATT: 5
        GTGCGCCGTAG: 3
        GTGCGCCTCGC: 3
        GTGCGCTGACA: 4
        GTGCGCTTTGT: 3
        GTGGATTAAAA: 1
        GTGTCTGATAG: 1
        GTGTGGATTAA: 1
        GTTTGTACCCA: 1
        GTTTGTACCCC: 1
        GTTTGTACCCT: 3
        TAAAAAAAGAG: 1
        TACCCAGATTT: 4
        TACCCCGTAGT: 4
        TACCCCTCGCA: 2
        TACCCTGACAA: 5
        TACCCTTTGTA: 2
        TAGATTTGACT: 4
        TAGCAGCTGAC: 1
        TAGTGCGCAGA: 5
        TAGTGCGCCGT: 3
        TAGTGCGCCTC: 3
        TAGTGCGCTGA: 4
        TAGTGCGCTTT: 3
        TATGTCTCTGT: 1
        TCATTCTGACT: 1
        TCGCACCAGAG: 4
        TCGCACCAGCG: 2
        TCGCACCAGCT: 1
        TCGCACCAGTG: 2
        TCGCACCAGTT: 5
        TCGTAGTGCGC: 6
        TCTCGCACCAG: 3
        TCTCTGTGTGG: 1
        TCTGACTGCAA: 1
        TCTGATAGCAG: 1
        TCTGTGTGGAT: 1
        TGACAAGGCAG: 4
        TGACAAGGCCG: 3
        TGACAAGGCCT: 5
        TGACAAGGCTG: 8
        TGACAAGGCTT: 3
        TGACTAGATTT: 4
        TGACTCGTAGT: 6
        TGACTCTCGCA: 3
        TGACTGCAACG: 1
        TGACTTGACAA: 4
        TGACTTTTGTA: 4
        TGATAGCAGCT: 1
        TGCAACGGGCA: 1
        TGCGCAGATTT: 5
        TGCGCCGTAGT: 3
        TGCGCCTCGCA: 3
        TGCGCTGACAA: 4
        TGCGCTTTGTA: 3
        TGGATTAAAAA: 1
        TGTACCCAGAT: 4
        TGTACCCCGTA: 4
        TGTACCCCTCG: 2
        TGTACCCTGAC: 5
        TGTACCCTTTG: 2
        TGTCTCTGTGT: 1
        TGTCTGATAGC: 1
        TGTGGATTAAA: 1
        TGTGTGGATTA: 1
        TTAAAAAAAGA: 1
        TTCATTCTGAC: 1
        TTCTGACTGCA: 1
        TTGACAAGGCC: 3
        TTGACAAGGCT: 1
        TTGACTAGATT: 4
        TTGACTCGTAG: 6
        TTGACTCTCGC: 3
        TTGACTTGACA: 4
        TTGACTTTTGT: 4
        TTGTACCCAGA: 4
        TTGTACCCCGT: 4
        TTGTACCCCTC: 2
        TTGTACCCTGA: 5
        TTGTACCCTTT: 2
        TTTCATTCTGA: 1
        TTTGACTAGAT: 4
        TTTGACTCGTA: 6
        TTTGACTCTCG: 3
        TTTGACTTGAC: 4
        TTTGACTTTTG: 4
        TTTGTACCCAG: 4
        TTTGTACCCCG: 4
        TTTGTACCCCT: 2
        TTTGTACCCTG: 5
        TTTGTACCCTT: 2
        TTTTCATTCTG: 1
        TTTTGTACCCC: 3
        TTTTGTACCCT: 1
      }
      max: {
        count: 13
        mers: [
          'GCTGACAAGGC'
          'CAGATTTGACT'
        ]
      }
    }
  }
  {
    Type     : Bioi.Dna
    sequence : vibrioCholeraeOriC
    k        : 9
    kMers    : {
      max: {
        count: 3,
        mers: [ 'ATGATCAAG', 'CTCTTGATC', 'TCTTGATCA', 'CTTGATCAT' ]
      }
      all: {
        ATCAATGAT: 1,
        TCAATGATC: 1,
        CAATGATCA: 1,
        AATGATCAA: 2,
        ATGATCAAC: 1,
        TGATCAACG: 1,
        GATCAACGT: 1,
        ATCAACGTA: 1,
        TCAACGTAA: 1,
        CAACGTAAG: 1,
        AACGTAAGC: 1,
        ACGTAAGCT: 1,
        CGTAAGCTT: 1,
        GTAAGCTTC: 1,
        TAAGCTTCT: 1,
        AAGCTTCTA: 1,
        AGCTTCTAA: 1,
        GCTTCTAAG: 1,
        CTTCTAAGC: 1,
        TTCTAAGCA: 1,
        TCTAAGCAT: 1,
        CTAAGCATG: 1,
        TAAGCATGA: 1,
        AAGCATGAT: 2,
        AGCATGATC: 2,
        GCATGATCA: 2,
        CATGATCAA: 1,
        ATGATCAAG: 3,
        TGATCAAGG: 1,
        GATCAAGGT: 1,
        ATCAAGGTG: 1,
        TCAAGGTGC: 1,
        CAAGGTGCT: 1,
        AAGGTGCTC: 1,
        AGGTGCTCA: 1,
        GGTGCTCAC: 1,
        GTGCTCACA: 1,
        TGCTCACAC: 1,
        GCTCACACA: 1,
        CTCACACAG: 1,
        TCACACAGT: 1,
        CACACAGTT: 1,
        ACACAGTTT: 1,
        CACAGTTTA: 1,
        ACAGTTTAT: 1,
        CAGTTTATC: 1,
        AGTTTATCC: 1,
        GTTTATCCA: 1,
        TTTATCCAC: 1,
        TTATCCACA: 1,
        TATCCACAA: 1,
        ATCCACAAC: 1,
        TCCACAACC: 1,
        CCACAACCT: 1,
        CACAACCTG: 1,
        ACAACCTGA: 1,
        CAACCTGAG: 1,
        AACCTGAGT: 1,
        ACCTGAGTG: 1,
        CCTGAGTGG: 1,
        CTGAGTGGA: 1,
        TGAGTGGAT: 1,
        GAGTGGATG: 1,
        AGTGGATGA: 1,
        GTGGATGAC: 1,
        TGGATGACA: 1,
        GGATGACAT: 1,
        GATGACATC: 1,
        ATGACATCA: 1,
        TGACATCAA: 1,
        GACATCAAG: 1,
        ACATCAAGA: 1,
        CATCAAGAT: 1,
        ATCAAGATA: 1,
        TCAAGATAG: 1,
        CAAGATAGG: 1,
        AAGATAGGT: 1,
        AGATAGGTC: 1,
        GATAGGTCG: 1,
        ATAGGTCGT: 1,
        TAGGTCGTT: 1,
        AGGTCGTTG: 1,
        GGTCGTTGT: 1,
        GTCGTTGTA: 1,
        TCGTTGTAT: 1,
        CGTTGTATC: 1,
        GTTGTATCT: 1,
        TTGTATCTC: 1,
        TGTATCTCC: 1,
        GTATCTCCT: 1,
        TATCTCCTT: 1,
        ATCTCCTTC: 1,
        TCTCCTTCC: 1,
        CTCCTTCCT: 1,
        TCCTTCCTC: 1,
        CCTTCCTCT: 1,
        CTTCCTCTC: 1,
        TTCCTCTCG: 1,
        TCCTCTCGT: 1,
        CCTCTCGTA: 1,
        CTCTCGTAC: 1,
        TCTCGTACT: 1,
        CTCGTACTC: 1,
        TCGTACTCT: 1,
        CGTACTCTC: 1,
        GTACTCTCA: 1,
        TACTCTCAT: 1,
        ACTCTCATG: 1,
        CTCTCATGA: 1,
        TCTCATGAC: 1,
        CTCATGACC: 1,
        TCATGACCA: 1,
        CATGACCAC: 1,
        ATGACCACG: 1,
        TGACCACGG: 1,
        GACCACGGA: 1,
        ACCACGGAA: 1,
        CCACGGAAA: 1,
        CACGGAAAG: 1,
        ACGGAAAGA: 1,
        CGGAAAGAT: 1,
        GGAAAGATG: 1,
        GAAAGATGA: 1,
        AAAGATGAT: 1,
        AAGATGATC: 1,
        AGATGATCA: 1,
        GATGATCAA: 1,
        TGATCAAGA: 1,
        GATCAAGAG: 1,
        ATCAAGAGA: 1,
        TCAAGAGAG: 1,
        CAAGAGAGG: 1,
        AAGAGAGGA: 1,
        AGAGAGGAT: 1,
        GAGAGGATG: 1,
        AGAGGATGA: 1,
        GAGGATGAT: 1,
        AGGATGATT: 1,
        GGATGATTT: 1,
        GATGATTTC: 1,
        ATGATTTCT: 1,
        TGATTTCTT: 1,
        GATTTCTTG: 1,
        ATTTCTTGG: 1,
        TTTCTTGGC: 1,
        TTCTTGGCC: 1,
        TCTTGGCCA: 1,
        CTTGGCCAT: 1,
        TTGGCCATA: 1,
        TGGCCATAT: 1,
        GGCCATATC: 1,
        GCCATATCG: 1,
        CCATATCGC: 1,
        CATATCGCA: 1,
        ATATCGCAA: 1,
        TATCGCAAT: 1,
        ATCGCAATG: 1,
        TCGCAATGA: 1,
        CGCAATGAA: 1,
        GCAATGAAT: 1,
        CAATGAATA: 1,
        AATGAATAC: 1,
        ATGAATACT: 1,
        TGAATACTT: 1,
        GAATACTTG: 1,
        AATACTTGT: 1,
        ATACTTGTG: 1,
        TACTTGTGA: 1,
        ACTTGTGAC: 1,
        CTTGTGACT: 1,
        TTGTGACTT: 1,
        TGTGACTTG: 1,
        GTGACTTGT: 1,
        TGACTTGTG: 1,
        GACTTGTGC: 1,
        ACTTGTGCT: 1,
        CTTGTGCTT: 1,
        TTGTGCTTC: 1,
        TGTGCTTCC: 1,
        GTGCTTCCA: 1,
        TGCTTCCAA: 1,
        GCTTCCAAT: 1,
        CTTCCAATT: 1,
        TTCCAATTG: 1,
        TCCAATTGA: 1,
        CCAATTGAC: 1,
        CAATTGACA: 1,
        AATTGACAT: 1,
        ATTGACATC: 1,
        TTGACATCT: 1,
        TGACATCTT: 1,
        GACATCTTC: 1,
        ACATCTTCA: 1,
        CATCTTCAG: 1,
        ATCTTCAGC: 1,
        TCTTCAGCG: 1,
        CTTCAGCGC: 1,
        TTCAGCGCC: 1,
        TCAGCGCCA: 1,
        CAGCGCCAT: 1,
        AGCGCCATA: 1,
        GCGCCATAT: 1,
        CGCCATATT: 1,
        GCCATATTG: 1,
        CCATATTGC: 1,
        CATATTGCG: 1,
        ATATTGCGC: 1,
        TATTGCGCT: 1,
        ATTGCGCTG: 1,
        TTGCGCTGG: 1,
        TGCGCTGGC: 1,
        GCGCTGGCC: 1,
        CGCTGGCCA: 1,
        GCTGGCCAA: 1,
        CTGGCCAAG: 1,
        TGGCCAAGG: 1,
        GGCCAAGGT: 1,
        GCCAAGGTG: 1,
        CCAAGGTGA: 1,
        CAAGGTGAC: 1,
        AAGGTGACG: 1,
        AGGTGACGG: 1,
        GGTGACGGA: 1,
        GTGACGGAG: 1,
        TGACGGAGC: 1,
        GACGGAGCG: 1,
        ACGGAGCGG: 1,
        CGGAGCGGG: 1,
        GGAGCGGGA: 1,
        GAGCGGGAT: 1,
        AGCGGGATT: 1,
        GCGGGATTA: 1,
        CGGGATTAC: 1,
        GGGATTACG: 1,
        GGATTACGA: 1,
        GATTACGAA: 1,
        ATTACGAAA: 1,
        TTACGAAAG: 1,
        TACGAAAGC: 1,
        ACGAAAGCA: 1,
        CGAAAGCAT: 1,
        GAAAGCATG: 1,
        AAAGCATGA: 1,
        CATGATCAT: 1,
        ATGATCATG: 1,
        TGATCATGG: 1,
        GATCATGGC: 1,
        ATCATGGCT: 1,
        TCATGGCTG: 1,
        CATGGCTGT: 1,
        ATGGCTGTT: 1,
        TGGCTGTTG: 1,
        GGCTGTTGT: 1,
        GCTGTTGTT: 1,
        CTGTTGTTC: 1,
        TGTTGTTCT: 1,
        GTTGTTCTG: 1,
        TTGTTCTGT: 1,
        TGTTCTGTT: 1,
        GTTCTGTTT: 1,
        TTCTGTTTA: 1,
        TCTGTTTAT: 1,
        CTGTTTATC: 1,
        TGTTTATCT: 1,
        GTTTATCTT: 1,
        TTTATCTTG: 1,
        TTATCTTGT: 1,
        TATCTTGTT: 1,
        ATCTTGTTT: 1,
        TCTTGTTTT: 1,
        CTTGTTTTG: 1,
        TTGTTTTGA: 1,
        TGTTTTGAC: 1,
        GTTTTGACT: 1,
        TTTTGACTG: 1,
        TTTGACTGA: 1,
        TTGACTGAG: 1,
        TGACTGAGA: 1,
        GACTGAGAC: 1,
        ACTGAGACT: 1,
        CTGAGACTT: 1,
        TGAGACTTG: 1,
        GAGACTTGT: 1,
        AGACTTGTT: 1,
        GACTTGTTA: 1,
        ACTTGTTAG: 1,
        CTTGTTAGG: 1,
        TTGTTAGGA: 1,
        TGTTAGGAT: 1,
        GTTAGGATA: 1,
        TTAGGATAG: 1,
        TAGGATAGA: 1,
        AGGATAGAC: 1,
        GGATAGACG: 1,
        GATAGACGG: 1,
        ATAGACGGT: 1,
        TAGACGGTT: 1,
        AGACGGTTT: 1,
        GACGGTTTT: 1,
        ACGGTTTTT: 1,
        CGGTTTTTC: 1,
        GGTTTTTCA: 1,
        GTTTTTCAT: 1,
        TTTTTCATC: 1,
        TTTTCATCA: 1,
        TTTCATCAC: 1,
        TTCATCACT: 1,
        TCATCACTG: 1,
        CATCACTGA: 1,
        ATCACTGAC: 1,
        TCACTGACT: 1,
        CACTGACTA: 1,
        ACTGACTAG: 1,
        CTGACTAGC: 1,
        TGACTAGCC: 1,
        GACTAGCCA: 1,
        ACTAGCCAA: 1,
        CTAGCCAAA: 1,
        TAGCCAAAG: 1,
        AGCCAAAGC: 1,
        GCCAAAGCC: 1,
        CCAAAGCCT: 1,
        CAAAGCCTT: 1,
        AAAGCCTTA: 1,
        AAGCCTTAC: 1,
        AGCCTTACT: 1,
        GCCTTACTC: 1,
        CCTTACTCT: 1,
        CTTACTCTG: 1,
        TTACTCTGC: 1,
        TACTCTGCC: 1,
        ACTCTGCCT: 1,
        CTCTGCCTG: 1,
        TCTGCCTGA: 1,
        CTGCCTGAC: 1,
        TGCCTGACA: 1,
        GCCTGACAT: 1,
        CCTGACATC: 1,
        CTGACATCG: 1,
        TGACATCGA: 1,
        GACATCGAC: 1,
        ACATCGACC: 1,
        CATCGACCG: 1,
        ATCGACCGT: 1,
        TCGACCGTA: 1,
        CGACCGTAA: 1,
        GACCGTAAA: 1,
        ACCGTAAAT: 1,
        CCGTAAATT: 1,
        CGTAAATTG: 1,
        GTAAATTGA: 1,
        TAAATTGAT: 1,
        AAATTGATA: 1,
        AATTGATAA: 1,
        ATTGATAAT: 1,
        TTGATAATG: 1,
        TGATAATGA: 1,
        GATAATGAA: 1,
        ATAATGAAT: 1,
        TAATGAATT: 1,
        AATGAATTT: 1,
        ATGAATTTA: 1,
        TGAATTTAC: 1,
        GAATTTACA: 1,
        AATTTACAT: 1,
        ATTTACATG: 1,
        TTTACATGC: 1,
        TTACATGCT: 1,
        TACATGCTT: 1,
        ACATGCTTC: 1,
        CATGCTTCC: 1,
        ATGCTTCCG: 1,
        TGCTTCCGC: 1,
        GCTTCCGCG: 1,
        CTTCCGCGA: 1,
        TTCCGCGAC: 1,
        TCCGCGACG: 1,
        CCGCGACGA: 1,
        CGCGACGAT: 1,
        GCGACGATT: 1,
        CGACGATTT: 1,
        GACGATTTA: 1,
        ACGATTTAC: 1,
        CGATTTACC: 1,
        GATTTACCT: 1,
        ATTTACCTC: 1,
        TTTACCTCT: 1,
        TTACCTCTT: 1,
        TACCTCTTG: 1,
        ACCTCTTGA: 1,
        CCTCTTGAT: 1,
        CTCTTGATC: 3,
        TCTTGATCA: 3,
        CTTGATCAT: 3,
        TTGATCATC: 2,
        TGATCATCG: 2,
        GATCATCGA: 1,
        ATCATCGAT: 1,
        TCATCGATC: 1,
        CATCGATCC: 1,
        ATCGATCCG: 1,
        TCGATCCGA: 1,
        CGATCCGAT: 1,
        GATCCGATT: 1,
        ATCCGATTG: 1,
        TCCGATTGA: 1,
        CCGATTGAA: 1,
        CGATTGAAG: 1,
        GATTGAAGA: 1,
        ATTGAAGAT: 1,
        TTGAAGATC: 1,
        TGAAGATCT: 1,
        GAAGATCTT: 1,
        AAGATCTTC: 1,
        AGATCTTCA: 1,
        GATCTTCAA: 1,
        ATCTTCAAT: 1,
        TCTTCAATT: 1,
        CTTCAATTG: 1,
        TTCAATTGT: 1,
        TCAATTGTT: 1,
        CAATTGTTA: 1,
        AATTGTTAA: 1,
        ATTGTTAAT: 1,
        TTGTTAATT: 1,
        TGTTAATTC: 1,
        GTTAATTCT: 1,
        TTAATTCTC: 1,
        TAATTCTCT: 1,
        AATTCTCTT: 1,
        ATTCTCTTG: 1,
        TTCTCTTGC: 1,
        TCTCTTGCC: 1,
        CTCTTGCCT: 1,
        TCTTGCCTC: 1,
        CTTGCCTCG: 1,
        TTGCCTCGA: 1,
        TGCCTCGAC: 1,
        GCCTCGACT: 1,
        CCTCGACTC: 1,
        CTCGACTCA: 1,
        TCGACTCAT: 1,
        CGACTCATA: 1,
        GACTCATAG: 1,
        ACTCATAGC: 1,
        CTCATAGCC: 1,
        TCATAGCCA: 1,
        CATAGCCAT: 1,
        ATAGCCATG: 1,
        TAGCCATGA: 1,
        AGCCATGAT: 1,
        GCCATGATG: 1,
        CCATGATGA: 1,
        CATGATGAG: 1,
        ATGATGAGC: 1,
        TGATGAGCT: 1,
        GATGAGCTC: 1,
        ATGAGCTCT: 1,
        TGAGCTCTT: 1,
        GAGCTCTTG: 1,
        AGCTCTTGA: 1,
        GCTCTTGAT: 2,
        TTGATCATG: 1,
        TGATCATGT: 1,
        GATCATGTT: 1,
        ATCATGTTT: 1,
        TCATGTTTC: 1,
        CATGTTTCC: 1,
        ATGTTTCCT: 1,
        TGTTTCCTT: 1,
        GTTTCCTTA: 1,
        TTTCCTTAA: 1,
        TTCCTTAAC: 1,
        TCCTTAACC: 1,
        CCTTAACCC: 1,
        CTTAACCCT: 1,
        TTAACCCTC: 1,
        TAACCCTCT: 1,
        AACCCTCTA: 1,
        ACCCTCTAT: 1,
        CCCTCTATT: 1,
        CCTCTATTT: 1,
        CTCTATTTT: 1,
        TCTATTTTT: 1,
        CTATTTTTT: 1,
        TATTTTTTA: 1,
        ATTTTTTAC: 1,
        TTTTTTACG: 1,
        TTTTTACGG: 1,
        TTTTACGGA: 1,
        TTTACGGAA: 1,
        TTACGGAAG: 1,
        TACGGAAGA: 1,
        ACGGAAGAA: 1,
        CGGAAGAAT: 1,
        GGAAGAATG: 1,
        GAAGAATGA: 1,
        AAGAATGAT: 1,
        AGAATGATC: 1,
        GAATGATCA: 1,
        TGATCAAGC: 1,
        GATCAAGCT: 1,
        ATCAAGCTG: 1,
        TCAAGCTGC: 1,
        CAAGCTGCT: 1,
        AAGCTGCTG: 1,
        AGCTGCTGC: 1,
        GCTGCTGCT: 1,
        CTGCTGCTC: 1,
        TGCTGCTCT: 1,
        GCTGCTCTT: 1,
        CTGCTCTTG: 1,
        TGCTCTTGA: 1,
        GATCATCGT: 1,
        ATCATCGTT: 1,
        TCATCGTTT: 1,
        CATCGTTTC: 1
      }
    }
  }
  {
    Type     : Bioi.Dna
    sequence : 'CGGAGGACTCTAGGTAACGCTTATCAGGTCCATAGGACATTCA'
    k        : 3
    kMers    : {
      max: {
        count: 4
        mers: [ 'AGG' ]
      }
      all: {
        CGG: 1,
        GGA: 3,
        GAG: 1,
        AGG: 4,
        GAC: 2,
        ACT: 1,
        CTC: 1,
        TCT: 1,
        CTA: 1,
        TAG: 2,
        GGT: 2,
        GTA: 1,
        TAA: 1,
        AAC: 1,
        ACG: 1,
        CGC: 1,
        GCT: 1,
        CTT: 1,
        TTA: 1,
        TAT: 1,
        ATC: 1,
        TCA: 2,
        CAG: 1,
        GTC: 1,
        TCC: 1,
        CCA: 1,
        CAT: 2,
        ATA: 1,
        ACA: 1,
        ATT: 1,
        TTC: 1
      }
    }
  }
]
