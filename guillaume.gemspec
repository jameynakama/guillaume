# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guillaume/version'

Gem::Specification.new do |spec|
  spec.name          = "guillaume"
  spec.version       = Guillaume::VERSION
  spec.authors       = ["Jamey J. DeOrio"]
  spec.email         = ["jdeorio@gmail.com"]
  spec.description   = %q{Guillaume is a generative poetry creation tool using ngrams for predictive writing and a defined poetics for guiding its creation.}
  spec.summary       = "A generative poetry creation tool"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
