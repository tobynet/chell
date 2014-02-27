# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chell/version'

Gem::Specification.new do |spec|
  spec.name          = "chell"
  spec.version       = Chell::VERSION
  spec.authors       = ["toooooooby"]
  spec.email         = ["toby.net.info.mail+git@gmail.com"]
  spec.summary       = %q{csv + pry + lambda_driver => csv-shell => Chell}
  spec.description   = %q{Chell is a tool which is easy to manipulate CSV}
  spec.homepage      = "https://github.com/toooooooby/chell"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'pry', '~> 0.9.12'
  spec.add_dependency 'lambda_driver', '~> 1.2'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
