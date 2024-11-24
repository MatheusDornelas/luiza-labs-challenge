# frozen_string_literal: true

class UsersController < ApplicationController
  include Pagination
  before_action :set_user, only: %i[show]

  # GET /users
  def index
    users = UsersService.new({ per_page: per_page, page: paginate_offset, order_id: params[:order_id] }).fetch_users
    render json: users, include: [orders: [:products]]
  end

  # GET /users/1
  def show
    render json: @user, include: [orders: [:products]]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.includes(orders: [:products]).find_by({ external_id: params.expect(:id) })
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.expect
  end
end
