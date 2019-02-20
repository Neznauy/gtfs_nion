require 'spec_helper'

RSpec.describe GtfsNion::Feed::Loader do
  let(:klass) { described_class }
  let(:method) { :call }

  describe '#call' do
    context 'when local source' do
      let(:feed_path) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/feed.zip') }
      let(:source) { feed_path }

      it_behaves_like 'load feed'
    end

    context 'when remote source' do
      let(:feed_path) { 'http://example.com/gtfs_feed.zip' }
      let(:response_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/feed.zip') }
      let(:response_file) { File.open(response_file_path) }
      let(:source) { response_file_path }

      before do
        stub_request(:any, 'http://example.com/gtfs_feed.zip')
          .to_return(body: response_file, headers: {content_type: 'application/zip'})
      end

      it_behaves_like 'load feed'
    end
  end
end
