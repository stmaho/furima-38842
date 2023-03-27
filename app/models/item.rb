class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :category
  belong_to :condition
  belong_to :shopping_cost
  belong_to :prefecture
  belong_to :preparation
  has_one_attached :image


  validates :name,    presence: true
  validates :content, presence: true
  validates :price,   presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shopping_cost_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :preparation_id, numericality: { other_than: 1 , message: "can't be blank" }
end
