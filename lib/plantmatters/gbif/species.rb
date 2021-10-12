# frozen_string_literal: true

module Plantmatters
  module GBIF
    # models species data from GBIF
    class Species
      def initialize(searched_name:, id:)
        @searched_name = searched_name
        @id = id
      end

      def self.create(searched_name:, id:)
        return SpeciesNotFound.new(searched_name: searched_name, id: id) if id.nil?

        self.new(searched_name: searched_name, id: id)
      end

      def data
        @data ||= request_data
      end
      
      # def classification
      #   @classification ||= PM::GBIF::Classification.new(classification_data)
      # end

      # private

      def request_data
        species = Gbif::Species
        species.name_usage(key: @id)
      end

      # def classification_data
      #   { phylum: @data['phylum'],
      #     class: @data['class'],
      #     order: @data['order'],
      #     family: @data['family'],
      #     genus: @data['genus'] }
      # end
    end
  end
end
