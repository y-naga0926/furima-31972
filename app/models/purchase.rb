class Purchase < ApplicationRecord
  has_one :destination
  belongs_to :item
  belongs_to :user

  validates :user,  presence: true
  validates :item,  presence: true
end
