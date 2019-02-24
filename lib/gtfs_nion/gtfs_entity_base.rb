require 'csv'

module GtfsNion
  class GtfsEntityBase
    def initialize(attr_row:, data_row:)
      attr_row.each_with_index do |attr_name, i|
        instance_variable_set("@#{attr_name}".to_sym, data_row[i])
      end
    end
  end
end
