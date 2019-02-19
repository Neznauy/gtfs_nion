require 'fileutils'
require 'open-uri'
require 'pathname'

module GtfsNion
  module Feed
    class Loader
      def self.call
        FileUtils.mkdir_p(path) unless File.directory?(path)

        File.open(path.join('gtfs_feed.zip'), "wb") do |file|
          file.write open(source).read
        end
      end

      private

      def self.path
        Pathname.new(GtfsNion.config.file_path).join('gtfs_nion')
      end

      def self.source
        GtfsNion.config.source
      end
    end
  end
end
