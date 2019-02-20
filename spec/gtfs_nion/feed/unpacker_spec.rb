require 'spec_helper'

RSpec.describe GtfsNion::Feed::Unpacker do
  let(:klass) { described_class }

  describe '#call' do
    let(:feed_path) { File.expand_path(File.dirname(__FILE__) + '/../../fixtures/files/feed.zip') }
    let(:method) { :call }

    it_behaves_like 'unpack feed'
  end
end
