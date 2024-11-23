class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :external_id, null: false
      t.datetime :order_date, precision: 6, null: false
      t.uuid :user_id, null: false

      t.timestamps
    end

    add_foreign_key :orders, :users
  end
end
