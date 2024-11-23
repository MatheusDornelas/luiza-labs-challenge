class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products, id: :uuid do |t|
      t.integer :external_id, null: false
      t.float :price, null: false
      t.uuid :order_id, null: false

      t.timestamps
    end

    add_foreign_key :products, :orders
  end
end
