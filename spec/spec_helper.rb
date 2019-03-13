require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'rspec'
require 'gtfs_nion'
require "dry/configurable/test_interface"
require 'webmock/rspec'

module GtfsNion
  enable_test_interface
end

RSpec.configure do |config|
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed

  Dir[Pathname(__FILE__).dirname.join('support/**/*.rb').to_s].each do |file|
    require file
  end

  config.before(:each) { GtfsNion.reset_config }
end
