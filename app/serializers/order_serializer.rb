# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :order_id, :date, :total_value

  belongs_to :user
  has_many :products

  def order_id
    object.external_id
  end

  def date
    Time.parse(object.order_date.to_s).strftime('%Y-%m-%d')
  end

  def total_value
    object.total_value
  end
end
