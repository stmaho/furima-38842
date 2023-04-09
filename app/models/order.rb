class Order < ApplicationRecord
  attr_accessor :token
  
  belongs_to :user
  belongs_to :item
  has_one    :deliver_address

end
