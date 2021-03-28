# frozen_string_literal: true

require_relative 'lib/plantmatters/version'

Gem::Specification.new do |spec|
  spec.authors       = ['Kristina Spurgin']
  spec.name          = 'plantmatters'
  spec.summary       = 'Playing with plant data'
  spec.version       = Plantmatters::VERSION

  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.2')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry', '0.13.1'
  spec.add_development_dependency 'pry-byebug', '3.9.0'
  spec.add_development_dependency 'rubocop', '>=1.11.0'
  spec.add_development_dependency 'rubocop-rspec', '>=2.2.0'
end
