# frozen_string_literal: true

class Order < ApplicationRecord
  before_create :add_timestamps
  before_create :update_timestamp

  attribute :external_id, :integer
  attribute :order_date, :datetime
  attribute :user_id, :uuid

  belongs_to :user, optional: true, inverse_of: :orders

  has_many :products

  def total_value
    self.products.sum(:price).to_s
  end

  private

  def add_timestamps
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def update_timestamp
    self.updated_at = Time.now
  end
end
