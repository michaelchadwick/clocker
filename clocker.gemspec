# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'clocker/version'

source_uri = 'https://github.com/michaelchadwick/clocker'
rubygem_uri = 'http://rubygems.org/gems/clocker'

Gem::Specification.new do |spec|
  spec.name            = 'clocker'
  spec.summary         = 'Calculate code block duration'
  spec.version         = Clocker::VERSION
  spec.platform        = Gem::Platform::RUBY
  spec.authors         = ['Michael Chadwick']
  spec.email           = ['mike@neb.host']
  spec.homepage        = rubygem_uri
  spec.license         = 'MIT'
  spec.description     = 'Give Clocker some code to process, and it will run it and display how long it took to finish.'

  spec.files           = `git ls-files`.split("\n")
  spec.test_files      = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables     = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths   = ['lib']

  spec.metadata        = {
    "documentation_uri" => source_uri,
    "homepage_uri" => source_uri,
    "source_code_uri" => source_uri
  }

  ## development deps
  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 12.3"
end
