require 'spec_helper'

RSpec.describe GtfsNion::Feed::Parser do
  let(:instance) { described_class.new(file) }

  describe '#call' do
    context 'when agency model' do
      let(:file) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/gtfs_nion/agency.txt') }
      let(:object_array) { instance.call }

      it do
        expect(object_array).to be_a(Array)
        expect(object_array.count).to eq 1
        expect(object_array.first).to have_attributes(
          agency_id: "orgp",
          agency_name: "orgp",
          agency_url: "http://orgp.spb.ru/",
          agency_phone: "+7-812-573-9531",
          agency_timezone: "Europe/Moscow"
        )
      end
    end
  end
end
