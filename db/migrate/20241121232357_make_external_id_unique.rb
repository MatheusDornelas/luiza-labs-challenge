class MakeExternalIdUnique < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :external_id, unique: true
    add_index :orders, :external_id, unique: true
  end
end
