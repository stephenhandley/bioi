(function() {
  var Protein, Request, Sequence,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Request = require('request');

  Sequence = require('./Sequence');

  Protein = (function(superClass) {
    extend(Protein, superClass);

    function Protein() {
      return Protein.__super__.constructor.apply(this, arguments);
    }

    Protein.uniprot = function(args) {
      var uniprot_url;
      return uniprot_url = "http://www.uniprot.org/uniprot/" + args.id + ".txt";
    };

    return Protein;

  })(Sequence);

  module.exports = Protein;

}).call(this);
