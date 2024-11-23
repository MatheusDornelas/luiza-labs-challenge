# frozen_string_literal: true

class OrdersController < ApplicationController
  include Pagination
  before_action :set_order, only: %i[show]

  # GET /orders
  def index
    @orders = OrdersService.new({ per_page: per_page, page: paginate_offset, start_date: params[:start_date],
                                  end_date: params[:end_date] }).fetch_orders

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find_by({ external_id: params.expect(:id) })
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.fetch(:order, {})
  end
end
