# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'cube_ci/version'

Gem::Specification.new do |spec|
  spec.name          = "cube_ci"
  spec.version       = CubeCi::VERSION
  spec.authors       = ["David Parry"]
  spec.description   = %q{Show Travis build statuses on a 4x4x4 LED cube in real time}
  spec.summary       = %q{Travis build on a 4x4x4 cube}
  spec.homepage      = "https://suranyami.github.io/cube_ci"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "travis", "~> 1.6.3.travis.381.4"
  spec.add_runtime_dependency "lib_usb"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
