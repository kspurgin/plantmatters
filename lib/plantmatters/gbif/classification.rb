# frozen_string_literal: true

module Plantmatters
  module GBIF
    # models species classification data from GBIF
    class Classification
      attr_reader :phylum, :class, :order, :family, :genus, :species

      def initialize(hash)
        hash.each { |key, value| instance_variable_set("@#{key}", value) }
      end

      def to_h
        hash = {}
        instance_variables.each do |var|
          key = var.to_s.delete('@').to_sym
          hash[key] = instance_variable_get(var)
        end

        hash
      end

      def to_s
        [@phylum, @class, @order, @family, @genus, @species].join(' > ')
      end
    end
  end
end
