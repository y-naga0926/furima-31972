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

        it "建物名がない場合も登録できること" do
          @purchase.building_name = nil
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

        it '郵便番号が空だと登録できない' do
          @purchase.post_code = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Post code can't be blank")
        end

        it '市区町村が空だと登録できない' do
          @purchase.city = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空だと登録できない' do
          @purchase.address = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空だと登録できない' do
          @purchase.phone_number = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'prefecture_idが0だと登録できない' do
          @purchase.prefecture_id = 0
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '電話番号が半角英数字混合だと登録できない' do
          @purchase.phone_number = 'abc11111111'
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
