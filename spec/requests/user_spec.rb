# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'list users' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"user_id":1,"name":"Matheus","orders":[{"order_id":1,"date":"2021-03-12","total":"2469.12","products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]}]},{"user_id":2,"name":"Dornelas","orders":[{"order_id":2,"date":"2021-03-12","total":"2469.12","products":[{"product_id":3,"price":"1234.56"},{"product_id":4,"price":"1234.56"}]}]}]')
    end

    it 'list users filtered by order_id' do
      get users_path({ params: { order_id: 2 } })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"user_id":2,"name":"Dornelas","orders":[{"order_id":2,"date":"2021-03-12","total":"2469.12","products":[{"product_id":3,"price":"1234.56"},{"product_id":4,"price":"1234.56"}]}]}]')
    end

    it 'list users with pagination' do
      get users_path({ params: { page: 1, per_page: 1 } })
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('[{"user_id":1,"name":"Matheus","orders":[{"order_id":1,"date":"2021-03-12","total":"2469.12","products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]}]}]')
    end
  end

  describe 'GET /users/:id' do
    it 'list users' do
      get user_path(id: 1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('{"user_id":1,"name":"Matheus","orders":[{"order_id":1,"date":"2021-03-12","total":"2469.12","products":[{"product_id":1,"price":"1234.56"},{"product_id":2,"price":"1234.56"}]}]}')
    end
  end
end
