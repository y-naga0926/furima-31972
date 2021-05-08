class Destination < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :purchase
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
