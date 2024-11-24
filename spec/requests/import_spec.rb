# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportController, type: :request do
  describe 'POST /import-file' do
    let(:file) { fixture_file_upload('spec/fixtures/file-to-be-imported.txt', 'text/txt') }
    let(:params) { { file: file } }

    context 'must import file' do
      it 'return 204' do
        post '/import-file', params: params
        expect(response).to have_http_status(:no_content)
        expect(User.all.count).to eq(8)
      end
    end
  end
end
