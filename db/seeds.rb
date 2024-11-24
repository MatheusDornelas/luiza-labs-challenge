# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.insert_all([
  { external_id: 1, name: 'Matheus' },
  { external_id: 2, name: 'Dornelas' },
])

users = User.all

Order.insert_all([
  { external_id: 1, user_id: users[0].id, order_date: '2021-03-12' },
  { external_id: 2, user_id: users[1].id, order_date: '2021-03-12' },
])

orders = Order.all

Product.insert_all([
  { external_id: 1, price: 1234.56, order_id: orders[0].id },
  { external_id: 2, price: 1234.56, order_id: orders[0].id },
  { external_id: 3, price: 1234.56, order_id: orders[1].id },
  { external_id: 4, price: 1234.56, order_id: orders[1].id }
])