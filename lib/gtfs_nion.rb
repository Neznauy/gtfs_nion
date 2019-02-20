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

  def self.unpack_file
    GtfsNion::Feed::Unpacker.call
  end

  def self.load_and_unpack
    load_file
    unpack_file
  end
end
