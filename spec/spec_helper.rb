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

module Dry # Dry fix before pull request
  module Configurable
    module TestInterface
      def reset_config
        if self.is_a?(Class)
          @config = _settings.create_config
        else
          @config = self._settings.create_config
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.warnings = true
  config.order = :random
  Kernel.srand config.seed

  config.before(:each) { GtfsNion.reset_config }
end
