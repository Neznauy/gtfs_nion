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
  spec.require_paths = ['lib']
end
