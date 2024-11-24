# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /orders' do
    it 'list orders' do
      get orders_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"order_id":1,"date":"2021-03-12","total":"2469.12","user":{"user_id":1,"name":"Matheus"},"products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]},{"order_id":2,"date":"2021-03-12","total":"2469.12","user":{"user_id":2,"name":"Dornelas"},"products":[{"product_id":3,"price":"1234.56"},{"product_id":4,"price":"1234.56"}]}]')
    end

    it 'list orders filtered by start_date' do
      get orders_path({ params: { start_date: '2021-03-13' } })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[]')
    end

    it 'list orders filtered by end_date' do
      get orders_path({ params: { end_date: '2021-03-13' } })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"order_id":1,"date":"2021-03-12","total":"2469.12","user":{"user_id":1,"name":"Matheus"},"products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]},{"order_id":2,"date":"2021-03-12","total":"2469.12","user":{"user_id":2,"name":"Dornelas"},"products":[{"product_id":3,"price":"1234.56"},{"product_id":4,"price":"1234.56"}]}]')
    end

    it 'list orders with pagination' do
      get orders_path({ params: { page: 1, per_page: 1 } })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"order_id":1,"date":"2021-03-12","total":"2469.12","user":{"user_id":1,"name":"Matheus"},"products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]}]')
    end
  end

  describe 'GET /orders/:id' do
    it 'list orders' do
      get order_path(id: 1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('{"order_id":1,"date":"2021-03-12","total":"2469.12","user":{"user_id":1,"name":"Matheus"},"products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]}')
    end
  end
end
