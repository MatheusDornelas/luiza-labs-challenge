# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :user_id, :name
  has_many :orders, serializer: OrderSerializer

  def user_id
    object.external_id
  end
end
