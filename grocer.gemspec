$:.push File.expand_path("../lib", __FILE__)
require "grocer/version"

Gem::Specification.new do |spec|
  spec.name        = "grocer"
  spec.version     = Grocer::VERSION
  spec.authors     = ["Esmé Cowles", "Eliot Jordan"]
  spec.email       = ["escowles@ticklefish.org", "eliot.jordan@gmail.com"]
  spec.homepage    = "https://github.com/pulibrary/grocer"
  spec.summary     = "A backup manager for Fedora's produce."
  spec.description = "A backup manager for Fedora's produce."
  spec.license     = "APACHE2"

  spec.files         = `git ls-files | grep -v ^spec/fixtures`.split($\)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'engine_cart', '~> 1.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.47.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.10.0'
end
