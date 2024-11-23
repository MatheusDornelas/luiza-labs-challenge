# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :product_id, :price

  def product_id
    object.external_id
  end
end
