class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.integer :external_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
