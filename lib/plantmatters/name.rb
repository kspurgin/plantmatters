# frozen_string_literal: true

module Plantmatters
  # represents a plant name, which may include more data than just binomial name, or
  #   may not be a binomial name at all
  class Name
    def initialize(name)
      @orig = name
    end

    def binomial
      @orig.split[0..1].join(' ')
    end

    def cultivar
      try_match = @orig.match(/('.*')/)
      return '' unless try_match

      try_match[1]
    end

    def gbif_lookup; end

    def mix?
      @orig.downcase.match?(/ mix( .*|)$/)
    end
  end
end
