require 'fileutils'
require 'open-uri'
require 'pathname'

module GtfsNion
  module Feed
    class Loader
      def self.call
        FileUtils.mkdir_p(GtfsNion::Feed.gtfs_feed_folder_path) unless directory_exist?

        File.open(GtfsNion::Feed.gtfs_feed_file_path, "wb") do |file|
          file.write open(source).read
        end
      end

      private

      def self.directory_exist?
        File.directory?(GtfsNion::Feed.gtfs_feed_folder_path)
      end

      def self.source
        GtfsNion.config.source
      end
    end
  end
end
