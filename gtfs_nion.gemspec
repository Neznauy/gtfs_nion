require File.expand_path('../lib/gtfs_nion/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name        = "gtfs_nion"
  spec.version     = GtfsNion::VERSION
  spec.summary     = "Gem for work with raw GTFS data"
  spec.description = "Load GTFS data from remote sources and provide dsl for it's associations"
  spec.authors     = ["Alexandr \"Neznauy\" Shlyakov"]
  spec.homepage    = "https://github.com/Neznauy/gtfs_nion"
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -z`.split("\x0").grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'dry-configurable', '~> 0.8.1'
  spec.add_dependency 'dry-validation'
  spec.add_dependency 'i18n'
  spec.add_dependency 'rubyzip', '~> 1.1'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
