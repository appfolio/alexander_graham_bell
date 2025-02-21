# frozen_string_literal: true

require_relative 'lib/alexander_graham_bell/version'

Gem::Specification.new do |spec|
  spec.name          = 'alexander_graham_bell'
  spec.version       = AlexanderGrahamBell::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.author        = 'AppFolio'
  spec.email         = 'opensource@appfolio.com'
  spec.description   = 'Phone number parser and tel link creator.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/appfolio/alexander_graham_bell'
  spec.license       = 'MIT'
  spec.files         = Dir['**/*'].select { |f| f[%r{^(lib/|LICENSE.txt|.*gemspec)}] }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('< 3.5')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
end
