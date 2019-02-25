module GtfsNion
  module Validations
    class Agency
      def self.schema
        Dry::Validation.Schema do
          optional(:agency_id) { none? | str? }
          required(:agency_name).filled(:str?)
          required(:agency_url).filled(:str?)
          required(:agency_timezone).filled(:str?)
          optional(:agency_lang) { none? | str? }
          optional(:agency_phone) { none? | str? }
          optional(:agency_fare_url) { none? | str? }
          optional(:agency_email) { none? | str? }
        end
      end
    end
  end
end
