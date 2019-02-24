require 'gtfs_nion/feed/loader'
require 'gtfs_nion/feed/parser'
require 'gtfs_nion/feed/unpacker'
require 'pathname'

module GtfsNion
  module Feed
    private

    def self.gtfs_feed_file_path
      Pathname.new(GtfsNion.config.file_path).join('gtfs_nion/gtfs_feed.zip')
    end

    def self.gtfs_feed_folder_path
      Pathname.new(GtfsNion.config.file_path).join('gtfs_nion')
    end
  end
end
