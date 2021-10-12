# frozen_string_literal: true

module Plantmatters
  module GBIF
    # Uses gbifrb to get name suggestions for binomial in GBIF
    # Returns the species match JSON result if the species is found
    # Test with:
    #   Cercis canadensis (when searching species/match, first result is species as expected)
    #   Andropogon scoparius (when searching species/match, first result is genus and you
    #     need to dig into alternatives for species match)
    #   Dicentra spectabilis (when searching species/match, first result is synonym, and you
    #     need to get species key and return its hash)
    class SpeciesMatches
      def initialize(name: binomial)
        @binomial = name
      end

      def results
        @results ||= Gbif::Species.name_suggest(q: @binomial)
      end

      def species_key
        results.map{ |r| r['speciesKey'] }.tally.keys.first
      end
    end
  end
end
