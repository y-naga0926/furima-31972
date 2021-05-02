class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status

  validates :name, :price, :description, :user, presence: true

  validates :category_id, :prefecture_id, :shipping_cost_id, :shipping_day_id, :status_id, numericality: { other_than: 1 } 

end
