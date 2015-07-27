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
      symbol = AminoAcid.letterFor(symbol)
    @map[symbol]
```
- use mixins to share stuff between Codon, Rna and Peptide, Protein etc.
- how to represent structures... at least one representation is bond graph

# bioinformatics.org
- maybe some useful stuff here but code is a mess
- http://www.bioinformatics.org/sms2/scripts/sms_common.js


# understanding crispr
- https://en.wikipedia.org/wiki/CRISPR
- http://gizmodo.com/everything-you-need-to-know-about-crispr-the-new-tool-1702114381
- https://www.quantamagazine.org/20150206-crispr-dna-editor-bacteria/
- http://europepmc.org/articles/pmc4022601
- https://www.neb.com/tools-and-resources/feature-articles/crispr-cas9-and-targeted-genome-editing-a-new-era-in-molecular-biology
- http://www.nature.com/nbt/journal/v32/n4/fig_tab/nbt.2842_F2.html
- https://www.addgene.org/crispr/reference/history/
- https://www.addgene.org/crispr/guide/#Disrupt
- https://en.wikipedia.org/wiki/Homology_directed_repair
- https://en.wikipedia.org/wiki/Non-homologous_end_joining
- http://biology.stackexchange.com/questions/23283/how-does-non-homologous-end-joining-nhej-work
- http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3737331/
- http://www.wired.com/2015/07/crispr-dna-editing-2/
- http://andrew.gibiansky.com/blog/genetics/crispr/
