class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_cost
  belongs_to :prefecture
  belongs_to :preparation
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
