class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_cord, :prefecture_id, :city, :address1, :address2, :phon_number

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
    validates :city
    validates :address1
    validates :phon_number
  end

end
