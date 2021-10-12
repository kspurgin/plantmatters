# Given list of binomial names, checks each for presence in reference file and writes out to
#   output file if found there
# Reference file is saved HTML source from https://auth1.dpr.ncparks.gov/flora/plant_list.php
#   limited to native plants, with autosuggest population/script code removed
require 'csv'
require 'pry'

reference = File.read(File.expand_path('~/tmp/flora_plant_list.html'))
output = File.expand_path('~/tmp/tagged_native.txt')
natives = []

total_ct = 0

list = File.readlines(File.expand_path('~/tmp/wishlist.txt')).each do |name|
  name = name.chomp
  total_ct += 1
  natives << name if reference.match?(name)
end

puts "Total: #{total_ct}"
puts "Native: #{natives.length}"

CSV.open(output, 'w') do |csv|
  natives.each{ |name| csv << [name] }
end




