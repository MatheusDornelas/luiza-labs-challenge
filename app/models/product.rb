# frozen_string_literal: true

class Product < ApplicationRecord
  before_create :add_timestamps
  before_create :update_timestamp

  attribute :external_id, :string
  attribute :price, :float

  belongs_to :order

  private

  def add_timestamps
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def update_timestamp
    self.updated_at = Time.now
  end
end
