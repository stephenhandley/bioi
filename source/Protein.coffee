Request = require('request')

Sequence = require('./Sequence')

class Protein extends Sequence
  @uniprot: (args)->
    uniprot_url = "http://www.uniprot.org/uniprot/#{args.id}.txt"

module.exports = Protein
