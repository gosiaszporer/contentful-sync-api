# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  let(:product) { create(:product) }

  describe 'GET /products/index' do
    before do
      product
      get '/products/index'
    end

    it 'returns products' do
      expect(json).not_to be_empty
    end

    it 'returns correct keys' do
      expect(json.keys).to eq(%w[items sys])
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
