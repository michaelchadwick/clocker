# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clocker/version'

Gem::Specification.new do |spec|
  spec.name            = 'clocker'
  spec.version         = Clocker::VERSION
  spec.platform        = Gem::Platform::RUBY
  spec.authors         = ['Michael Chadwick']
  spec.email           = ['mike@codana.me']
  spec.homepage        = 'http://rubygems.org/gems/clocker'
  spec.summary         = 'Calculate how long a command or block of code takes to run'
  spec.description     = 'Give Clocker some code to process, and it will run it and display how long it took to finish.'

  spec.files           = `git ls-files`.split("\n")
  spec.test_files      = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables     = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths   = ['lib']
  spec.license         = 'MIT'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
