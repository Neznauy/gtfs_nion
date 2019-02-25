require 'spec_helper'

RSpec.describe GtfsNion::Validations::Agency do
  let(:klass) { described_class.schema.call(params) }
  let(:full_params) do
    {
      agency_id: 'orgp',
      agency_name: 'ogrp',
      agency_url: 'http://orgp.spb.ru/',
      agency_timezone: 'Europe/Moscow',
      agency_lang: 'ru',
      agency_phone: '+7-812-573-9531',
      agency_fare_url: 'http://orgp.spb.ru/',
      agency_email: 'sekretar@orgp.spb.ru'
    }
  end

  context 'when valid params' do
    let(:params) { full_params }

    it { expect(klass.messages).to eq({}) }
  end

  context 'when required param is missing' do
    context 'when agency_name is missing' do
      let(:params) { full_params.reject { |k,_v| k == :agency_name } }

      it { expect(klass.messages).to include(agency_name: [I18n.t('errors.key?')]) }
    end

    context 'when agency_url is missing' do
      let(:params) { full_params.reject { |k,_v| k == :agency_url } }

      it { expect(klass.messages).to include(agency_url: [I18n.t('errors.key?')]) }
    end

    context 'when agency_timezone is missing' do
      let(:params) { full_params.reject { |k,_v| k == :agency_timezone } }

      it { expect(klass.messages).to include(agency_timezone: [I18n.t('errors.key?')]) }
    end
  end

  context 'when required param is empty' do
    context 'when agency_name is empty' do
      let(:params) { full_params.tap { |p| p[:agency_name] = nil } }

      it { expect(klass.messages).to include(agency_name: [I18n.t('errors.filled?')]) }
    end

    context 'when agency_url is empty' do
      let(:params) { full_params.tap { |p| p[:agency_url] = nil } }

      it { expect(klass.messages).to include(agency_url: [I18n.t('errors.filled?')]) }
    end

    context 'when agency_timezone is empty' do
      let(:params) { full_params.tap { |p| p[:agency_timezone] = nil } }

      it { expect(klass.messages).to include(agency_timezone: [I18n.t('errors.filled?')]) }
    end
  end
end
