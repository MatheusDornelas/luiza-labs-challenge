# frozen_string_literal: true

class FileParserService
  def initialize(file)
    @file = file
  end

  def parse_lines
    ActiveRecord::Base.transaction do
      @file.each do |line|
        user_id = line.slice(0..9).to_i
        user_name = line.slice(10..54).strip
        user = save_user(user_id, user_name)

        order_id = line.slice(55..64).to_i
        order_date = line.slice(87..94)
        order = save_order(order_id, order_date, user)

        product_id = line.slice(65..74).to_i
        product_price = parse_price(line.slice(75..86).strip)
        save_product(product_id, product_price, order)
      end
    end
  end

  private

  def save_user(external_id, name)
    User.find_or_create_by({ external_id: external_id }) do |user|
      user.external_id = external_id
      user.name = name
    end
  end

  def save_order(external_id, order_date, user)
    Order.find_or_create_by({ external_id: external_id }) do |order|
      order.external_id = external_id
      order.order_date = order_date
      order.user_id = user.id
    end
  end

  def save_product(external_id, price, order)
    product = Product.new
    product.external_id = external_id
    product.price = price
    product.order_id = order.id
    product.save!
  end

  def parse_price(string_price)
    string_price.to_f
  end
end
