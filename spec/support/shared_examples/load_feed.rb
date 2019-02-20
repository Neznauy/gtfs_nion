RSpec.shared_examples 'load feed' do
  let(:config_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../tmp') }
  let(:file_path) { config_file_path + '/gtfs_nion/gtfs_feed.zip' }

  before do
    GtfsNion.config.source = feed_path
    GtfsNion.config.file_path = config_file_path
    klass.send(method)
  end

  after { FileUtils.rm_rf(config_file_path) }

  it { expect(FileUtils.identical?(source, file_path)).to be_truthy }
end
