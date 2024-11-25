# frozen_string_literal: true

module Pagination
  extend ActiveSupport::Concern

  def default_per_page
    10
  end

  def page
    params[:page]&.to_i || 1
  end

  def per_page
    params[:per_page]&.to_i || default_per_page
  end

  def paginate_offset
    (page - 1) * per_page
  end
end
