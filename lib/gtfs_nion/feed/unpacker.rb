require 'fileutils'
require 'zip'

module GtfsNion
  module Feed
    class Unpacker
      def self.call
        raise ArgumentError.new("Unable to find gtfs feed file.") unless gtfs_file_exist?
        
        Zip::File.open(GtfsNion::Feed.gtfs_feed_file_path) do |zip_file|
          zip_file.each { |entry| entry.extract(GtfsNion::Feed.gtfs_feed_folder_path.join(entry.name)) }
        end
      end

      private

      def self.gtfs_file_exist?
        File.exist?(GtfsNion::Feed.gtfs_feed_file_path)
      end
    end
  end
end
