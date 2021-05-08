class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :status

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :name, :description, presence: true
  validates  :price,  presence: true, format: {with: VALID_PRICE_REGEX }, numericality: { only_integer: true,
    greater_than: 299, less_than: 10000000
    }

  validates :category_id, :prefecture_id, :shipping_cost_id, :shipping_day_id, :status_id, numericality: { other_than: 1 } 
  validates :image, presence: true
end
