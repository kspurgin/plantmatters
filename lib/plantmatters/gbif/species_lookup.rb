# frozen_string_literal: true

module Plantmatters
  module GBIF
    # looks up binomial in GBIF and returns the species match JSON result if the species is found
    # test with: andropogon scoparius (first result is genus, need to dig into alternatives for species match)
    class SpeciesLookup
      BASEURI = 'https://api.gbif.org/v1/species/match?verbose=true&kingdom=Plantae&name='
      def initialize(binomial)
        @binomial = binomial
        @response = get_response
        response_data = @response.is_a?(Net::HTTPSuccess) ? JSON.parse(@response.body) : {}
        species_data = SpeciesResponse.new(response_data).get_species
      end

      def species_data; end

      private

      def get_response
        uri = URI("#{BASEURI}#{@binomial}")
        @response = Net::HTTP.get_response(uri)
      end

      def misc
        return PM::GBIF::Species.new(@binomial)

        PM::GBIF::SpeciesNotFound.new(@binomial)
      end
    end
  end
end
