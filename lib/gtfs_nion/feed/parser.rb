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
          entity = model.new(attr_row: attrs, data_row: line.parse_csv)

          unless validator(entity).schema.call(entity.attributes).messages.empty?
            raise GtfsNion::InvalidGtfsError
          end
          collection << entity
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

      def validator(entity)
        GtfsNion::Validations.const_get(entity.class.to_s.split('::').last)
      end
    end
  end
end
