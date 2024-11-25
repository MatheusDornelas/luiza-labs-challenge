require 'rails_helper'
RSpec.describe FileParserJob, type: :job do
  describe 'perfom' do
    let(:file) { fixture_file_upload('spec/fixtures/file-to-be-imported.txt', 'text/txt') }
    let(:params) { { file: file } }
    let(:redis) { REDIS_CLIENT }
    let(:cache_id) { SecureRandom.uuid }

    context 'asdasdasdas' do
      before do
        allow(redis).to receive(:get).with(cache_id).and_return(File.new(file).read)
      end
      it 'must save file content' do
        described_class.new.perform(cache_id)
        expect(User.all.count).to eq(8)
        expect(Order.all.count).to eq(8)
        expect(Product.all.count).to eq(10)
      end
    end
  end
end
