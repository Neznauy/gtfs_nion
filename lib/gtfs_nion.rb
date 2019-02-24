require 'dry-configurable'
require 'gtfs_nion/gtfs_entity_base'
require 'gtfs_nion/agency'
require 'gtfs_nion/feed'
require 'gtfs_nion/version'

module GtfsNion    
  extend ::Dry::Configurable

  MODELS = [:agency, :stop, :routes, :trips, :stop_times, :calendar, :calendar_dates, :fare_attributes, 
            :fare_rules, :shapes, :frequencies, :transfers, :feed_info].freeze

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

  def self.parse(model)
    raise ArgumentError.new("Invalid model name: #{model}") unless MODELS.include?(model.downcase.to_sym)
    
    file = GtfsNion::Feed.gtfs_feed_folder_path.join("#{model}.txt")
    raise ArgumentError.new("Unable to find gtfs #{model} file.") unless File.exist?(file)

    GtfsNion::Feed::Parser.new(file).call
  end
end
