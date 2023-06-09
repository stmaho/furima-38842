class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address1, :address2, :phon_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address1
    validates :phon_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    deliver_address = DeliverAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, phon_number: phon_number, order_id: order.id)
  end

end