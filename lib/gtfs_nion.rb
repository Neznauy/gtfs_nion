require 'dry-configurable'
require 'gtfs_nion/feed'
require 'gtfs_nion/version'

module GtfsNion    
  extend ::Dry::Configurable

  setting :source
  setting :file_path, ENV['XDG_DATA_HOME'] || "#{ENV["HOME"]}/.local/share"

  def self.load_file
    GtfsNion::Feed::Loader.call
  end
end
