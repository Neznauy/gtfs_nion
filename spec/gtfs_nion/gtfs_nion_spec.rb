require 'spec_helper'

RSpec.describe GtfsNion do
  it 'has a version number' do
    expect(GtfsNion::VERSION).not_to be_nil
  end

  describe '#config' do
    context 'when #source' do
      context 'when default source' do
        it 'has an empty default source' do
          expect(GtfsNion.config.source).to be_nil
        end
      end

      context 'when filled source' do
        before { GtfsNion.config.source = './test_source' }

        it 'has filled source' do
          expect(GtfsNion.config.source).to eq './test_source'
        end
      end
    end

    context 'when #file_path' do
      context 'when default file_path' do
        it 'has an empty default file_path' do
          expect(GtfsNion.config.file_path).to eq (ENV['XDG_DATA_HOME'] || "#{ENV['HOME']}/.local/share")
        end
      end

      context 'when filled file_path' do
        before { GtfsNion.config.file_path = './test_path' }

        it 'has filled file_path' do
          expect(GtfsNion.config.file_path).to eq './test_path'
        end
      end
    end
  end

  describe '#load_file' do
    let(:config_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../tmp') }
    let(:file_path) { config_file_path + '/gtfs_nion/gtfs_feed.zip' }

    before do
      GtfsNion.config.source = feed_path
      GtfsNion.config.file_path = config_file_path
    end

    after { FileUtils.rm_rf(config_file_path) }

    context 'when local source' do
      let(:feed_path) { File.expand_path(File.dirname(__FILE__) + '/../fixtures/files/feed.zip') }

      before { described_class.load_file }

      it { expect(FileUtils.identical?(feed_path, file_path)).to be_truthy }
    end

    context 'when remote source' do
      let(:feed_path) { 'http://example.com/gtfs_feed.zip' }
      let(:response_file_path) { File.expand_path(File.dirname(__FILE__) + '/../fixtures/files/feed.zip') }
      let(:response_file) { File.open(response_file_path) }

      before do
        stub_request(:any, 'http://example.com/gtfs_feed.zip')
          .to_return(body: response_file, headers: {content_type: 'application/zip'})
        described_class.load_file
      end

      it { expect(FileUtils.identical?(response_file_path, file_path)).to be_truthy }
    end 
  end
end
