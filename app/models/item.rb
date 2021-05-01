class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :status

  validates :name, :price, :description, :user, presence: true

  validates :categry_id, :prefecture_id, :shipping_cost_id, :shipping_days_id, status_id, numericality: { other_than: 1 } 

end
