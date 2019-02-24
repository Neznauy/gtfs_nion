require 'spec_helper'

RSpec.describe GtfsNion::Agency do
  let(:instance) { described_class.new(attr_row: attr_row, data_row: data_row) }

  let(:attr_row) do 
    [:agency_id, :agency_name, :agency_url, :agency_timezone,
     :agency_lang, :agency_phone, :agency_fare_url, :agency_email]
  end

  let(:data_row) do
    [:id, :name, :url, :timezone, :lang, :phone, :fare_url, :email]
  end

  describe '#agency_id' do
    it { expect(instance.agency_id).to eq :id }
  end

  describe '#agency_name' do
    it { expect(instance.agency_name).to eq :name }
  end

  describe '#agency_url' do
    it { expect(instance.agency_url).to eq :url }
  end

  describe '#agency_timezone' do
    it { expect(instance.agency_timezone).to eq :timezone }
  end

  describe '#agency_lang' do
    it { expect(instance.agency_lang).to eq :lang }
  end

  describe '#agency_phone' do
    it { expect(instance.agency_phone).to eq :phone }
  end

  describe '#agency_fare_url' do
    it { expect(instance.agency_fare_url).to eq :fare_url }
  end

  describe '#agency_email' do
    it { expect(instance.agency_email).to eq :email }
  end

  describe '#invalid_method' do
    let(:attr_row) { [:invalid_method] }
    let(:data_row) { [:invalid_value] }

    it { expect{instance.invalid_method}.to raise_error NoMethodError }
  end
end
