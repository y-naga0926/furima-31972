class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :birth_day
  end

  has_many :items
end
