# bioi
Bioinformatics stuff

# todo
- Codon map derp
```coffeescript
class Codon extends Sequence
  @map : {
  # https://en.wikipedia.org/wiki/DNA_codon_table
  }
  @forAminoAcid: (symbol)->
    if (symbol.length > 1)
      symbol = Protein.letterFor(symbol)
    @map[symbol]
```
- how to represent structures... at least one representation is bond graph 

# understanding crispr
- http://andrew.gibiansky.com/blog/genetics/crispr/
- http://www.wired.com/2015/07/crispr-dna-editing-2/
