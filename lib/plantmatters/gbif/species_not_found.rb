# frozen_string_literal: true

require_relative 'species'

module Plantmatters
  module GBIF
    # null object class for plant names not resolved to a GBIF species
    class SpeciesNotFound < Species
      def id
        ''
      end
    end
  end
end
