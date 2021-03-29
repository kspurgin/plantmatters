# frozen_string_literal: true

module Plantmatters
  # provide interface for dealing with input CSV
  class InputData
    # raised if CSV lacks specified or default plant name column
    class MissingNameColumnError < StandardError; end

    attr_reader :headers

    def initialize(filepath, name_column = 'binomial')
      @name_column = name_column.downcase
      @table = CSV.parse(File.read(filepath), headers: true)
      @headers = @table.headers.map(&:downcase)
      raise MissingNameColumnError unless @headers.include?(@name_column)
    end

    def names
      @table.by_col[name_index].map(&:strip).uniq.sort
    end

    private

    def name_index
      @headers.find_index(@name_column)
    end
  end
end
