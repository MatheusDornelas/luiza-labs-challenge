# frozen_string_literal: true

class OrdersService
  def initialize(params)
    @page = params[:page]
    @per_page = params[:per_page]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def fetch_orders
    orders = Order.includes([:products]).order(:external_id)
    orders = orders.where('order_date >= ?', @start_date) if @start_date.present?
    orders = orders.where('order_date <= ?', @end_date) if @end_date.present?
    orders.limit(@per_page).offset(@page)
  end
end
