# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportController, type: :request do
  describe 'POST /import-file' do
    let(:file) { fixture_file_upload('spec/fixtures/file-to-be-imported.txt', 'text/txt') }
    let(:params) { { file: file } }
    let(:cache_id) { SecureRandom.uuid }
    let(:redis) { REDIS_CLIENT }
    let(:worker) { FileParserJob }

    context 'must import file' do
      before do
        allow(SecureRandom).to receive(:uuid).and_return(cache_id)
        allow(redis).to receive(:set)
        allow(worker).to receive(:perform_async)
      end

      it 'return 204' do
        post '/import-file', params: params
        expect(redis).to have_received(:set).with(cache_id, File.new(file).read)
        expect(worker).to have_received(:perform_async).with(cache_id)
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
