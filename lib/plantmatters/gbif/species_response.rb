module Plantmatters
  module GBIF
    # models species JSON response as object
    class SpeciesResponse
      def initialize(binomial, hash)
        @binomial = binomial
        @hash = hash
      end

      def get_species
        return @hash if @hash['rank'] == 'SPECIES' && 
      end
    end
  end
end
