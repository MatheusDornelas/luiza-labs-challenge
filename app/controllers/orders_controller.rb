# frozen_string_literal: true

class OrdersController < ApplicationController
  include Pagination
  before_action :set_order, only: %i[show]

  def index
    @orders = OrdersService.new({ per_page: per_page, page: paginate_offset, start_date: params[:start_date],
                                  end_date: params[:end_date] }).fetch_orders

    render json: @orders
  end

  def show
    render json: @order
  end

  private

  def set_order
    @order = Order.find_by({ external_id: params.expect(:id) })
  end
end
