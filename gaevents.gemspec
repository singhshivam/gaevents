# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gaevents/version'

Gem::Specification.new do |spec|
  spec.name          = "gaevents"
  spec.version       = Gaevents::VERSION
  spec.authors       = ["singhshivam"]
  spec.email         = ["shivam@blogvault.net"]

  spec.summary       = %q{Sends events to google analytics in batches leveraging Measurement Protocol}
  spec.description   = %q{Provides an integration for sending multiple events to Google Analytics}
  spec.homepage      = "https://github.com/singhshivam/gaevents"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
	spec.add_runtime_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
end
