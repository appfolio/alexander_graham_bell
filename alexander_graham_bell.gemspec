# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alexander_graham_bell/version'

Gem::Specification.new do |spec|
  spec.name          = "alexander_graham_bell"
  spec.version       = AlexanderGrahamBell::VERSION
  spec.authors       = ["Scott Speidel","Michael Jewell"]
  spec.email         = ["scottspeidel@gmail.com", "michaeljewell9911@gmail.com"]

  spec.summary       = "Phone number parser and tel link creator."
  spec.homepage      = "https://github.com/appfolio/alexander-graham-bell"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
