# frozen_string_literal: true

class User < ApplicationRecord
  before_create :add_timestamps
  before_create :update_timestamp

  attribute :external_id, :string
  attribute :name, :string

  has_many :orders, inverse_of: :user

  private

  def add_timestamps
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def update_timestamp
    self.updated_at = Time.now
  end
end
