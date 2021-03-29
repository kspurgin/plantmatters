# frozen_string_literal: true

module Plantmatters
  # represents structured binomial name
  class Binomial
    attr_reader :genus, :specific_epithet

    def initialize(arr)
      @genus = arr[0]
      @specific_epithet = arr[1]
    end

    def to_s
      "#{@genus} #{specific_epithet}"
    end

    def to_str
      "#{@genus} #{specific_epithet}"
    end
  end
end
