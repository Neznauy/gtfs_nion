require 'spec_helper'

RSpec.describe GtfsNion::Feed::Loader do
  let(:klass) { described_class }

  describe '#call' do
    let(:config_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../tmp') }
    let(:file_path) { config_file_path + '/gtfs_nion/gtfs_feed.zip' }

    before do
      GtfsNion.config.source = feed_path
      GtfsNion.config.file_path = config_file_path
    end

    after { FileUtils.rm_rf(config_file_path) }

    context 'when local source' do
      let(:feed_path) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/feed.zip') }

      before { klass.call }

      it { expect(FileUtils.identical?(feed_path, file_path)).to be_truthy }
    end

    context 'when remote source' do
      let(:feed_path) { 'http://example.com/gtfs_feed.zip' }
      let(:response_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/feed.zip') }
      let(:response_file) { File.open(response_file_path) }

      before do
        stub_request(:any, 'http://example.com/gtfs_feed.zip')
          .to_return(body: response_file, headers: {content_type: 'application/zip'})
        klass.call
      end

      it { expect(FileUtils.identical?(response_file_path, file_path)).to be_truthy }
    end
  end
end
