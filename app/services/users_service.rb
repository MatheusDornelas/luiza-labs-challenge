# frozen_string_literal: true

class UsersService
  def initialize(params)
    @page = params[:page]
    @per_page = params[:per_page]
    @order_id = params[:order_id]
  end

  def fetch_users
    users = User.includes([orders: [:products]]).order(:external_id)
    users = users.where('orders.external_id = ?', @order_id) if @order_id.present?
    users.limit(@per_page).offset(@page)
  end
end
