module GtfsNion
  module Feed
    class Parser
      attr_reader :collection

      def initialize(file)
        @file       = file
        @collection = []
      end

      def call
        File.open(file).each_with_index do |line, index|
          next if index == 0
          collection << model.new(attr_row: attrs, data_row: line.parse_csv)
        end
        collection
      end

      private

      attr_reader :file

      def model
        @model ||= GtfsNion.const_get(File.basename(file, ".txt").capitalize)
      end

      def attrs
        @attrs ||= File.open(file) {|f| f.readline}.parse_csv.map { |col| col.to_sym }
      end
    end
  end
end
