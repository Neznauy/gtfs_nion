module GtfsNion
  class Agency < ::GtfsNion::GtfsEntityBase
    attr_reader :agency_id, :agency_name, :agency_url, :agency_timezone, :agency_lang, :agency_phone,
                :agency_fare_url, :agency_email
  end
end
