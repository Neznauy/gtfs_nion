RSpec.shared_examples 'unpack feed' do
  let(:config_file_path) { File.expand_path(File.dirname(__FILE__) + '/../../tmp') }
  let(:folder_path) { config_file_path + '/gtfs_nion' }
  let(:file_path) { folder_path + '/gtfs_feed.zip' }
  let(:files) {
    [:agency, :calendar, :calendar_dates, :fare_attributes, :fare_rules, :feed_info, :frequencies,
     :operator_routes, :operators, :routes, :shapes, :stop_times, :stops, :trips]
  }

  before do
    GtfsNion.config.file_path = config_file_path
    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)
  end

  after { FileUtils.rm_rf(config_file_path) }
  
  context 'when feed file exists' do
    before do
      FileUtils.cp(feed_path, file_path)
      klass.send(method)
    end

    it do
      Dir["#{folder_path}/*.txt"].each do |filename|
        expect(files).to include(File.basename(filename, ".txt").to_sym)
      end
    end
  end

  context 'when no feed file' do
    it { expect{klass.send(method)}.to raise_error(ArgumentError) }
  end
end
