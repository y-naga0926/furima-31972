require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_destination, user_id:@user.id ,item_id:@item.id )
    sleep 0.1 
  end

  
    describe '#create' do
      context '商品が購入できるとき' do
        it "必須項目が全てあれば購入できること" do
          expect(@purchase).to be_valid
        end

        it "電話番号にハイフンがない場合は登録できること" do
          @purchase.phone_number = 11111111111
          expect(@purchase).to be_valid
        end
      end

      context '商品が購入できないとき' do
        it 'user_idが空だと登録できない' do
          @purchase.user_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("User can't be blank")
        end
        it "item_idがない場合は登録できないこと" do
          @purchase.item_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Item can't be blank")
        end
        it "郵便番号にハイフンがない場合は登録できないこと" do
          @purchase.post_code = 1111111
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it "電話番号が12桁以上の場合は登録できないこと" do
          @purchase.phone_number = 111111111111
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
        end
        it "tokenが空では登録できないこと" do
          @purchase.token = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
end
