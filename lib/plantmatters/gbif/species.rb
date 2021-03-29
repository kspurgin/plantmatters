# frozen_string_literal: true

module Plantmatters
  module GBIF
    # models species data from GBIF
    class Species
      def initialize(binomial, data = {})
        @binomial = binomial
        @data = data
      end

      def classification
        @classification ||= PM::GBIF::Classification.new(classification_data)
      end

      def id
        @id ||= data['speciesKey']
      end

      private

      def classification_data
        { phylum: @data['phylum'],
          class: @data['class'],
          order: @data['order'],
          family: @data['family'],
          genus: @data['genus'] }
      end
    end
  end
end
