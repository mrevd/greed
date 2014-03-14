# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greed/version'

Gem::Specification.new do |spec|
  spec.name          = "greed"
  spec.version       = Greed::VERSION
  spec.authors       = ["Matt Ryan"]
  spec.email         = ["m@mrevd.me"]
  spec.summary       = %q{Ruby Koans: Greed Game (Extra Credit)}
  spec.description   = %q{TDD,OOP,FUN}
  spec.homepage      = "http://github.com/mrevd/greed"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard-minitest"
end
