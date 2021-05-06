class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item.id, :purhase, :current_user.id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format:{ with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
| birth_day            | date                | null: false               |
| birth_day            | date                | null: false               |
    user = User.create(nickname: nickname, email: email,  encrypted_password: encrypted_password, family_name: family_name, first_name: first_name, family_name_kana: family_name_kana, first_name_kana: first_name_kana, birth_day: birth_day )
    Destination.create(name: name, price:price, description: description, status_id: status.id, shipping_cost_id: shipping_cost.id, shipping_day_id: shipping_day.id, prefecture_id: prefecture.id, category_id: category.id, user: user.id )
  end