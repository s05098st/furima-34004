class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :prefecture_city, :prefecture_block, :prefecture_building, :phone_number, :order_id, :item_id

  with_options presence: ture do
    valiadtes :post_code
    valiadtes :prefecture_id, numericality: { other_than: 1, message: 'status Select' }
    valiadtes :prefecture_city
    valiadtes :prefecture_block
    valiadtes :phone_number
  end

  def save
    order = Order.create(item_id: item_id, user_id: user.id)
    address.create(post_code: post_code, prefecture_id: prefecture_id, prefecture_city: prefecture_city, prefecture_block: prefecture_block, prefecture_buildin: prefecture_buildin, phone_number: phone_number, order_id: order.id)
  end
end