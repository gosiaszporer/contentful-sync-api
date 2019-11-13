require 'rails_helper'

RSpec.describe 'Synchronizations API', type: :request do
  let(:product) { create(:product) }

  describe 'GET /synchronizations/download' do

    context 'when database is clean' do
      before { get "/synchronizations/download" }
      it 'creates product' do
        expect(Product.count).to eq(1)
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when product already exists' do
      before do 
        product 
        get "/synchronizations/download"
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Initial download alredy happened/)
      end
    end
  end

  describe 'GET /synchronizations/sync' do
      
    context 'after initial sync' do
      before do
        get "/synchronizations/download"
        get "/synchronizations/sync"
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'without initial sync' do
      before { get "/synchronizations/sync" }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/You can't synchronize without initial download/)
      end
    end
  end

  describe 'GET /synchronizations/reset' do
    before { get "/synchronizations/reset" }

    it 'creates product' do
      expect(Product.count).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end