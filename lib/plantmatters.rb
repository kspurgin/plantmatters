# frozen_string_literal: true

# standard library
require 'csv'

require 'pry'

Dir["#{File.dirname(__FILE__)}/../lib/plantmatters/*.rb"].each do |file|
  require "plantmatters/#{File.basename(file, File.extname(file))}"
end
Dir["#{File.dirname(__FILE__)}/../lib/plantmatters/gbif/*.rb"].each do |file|
  require "plantmatters/gbif/#{File.basename(file, File.extname(file))}"
end

module Plantmatters
  ::PM = Plantmatters
end
