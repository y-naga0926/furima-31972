require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe Item do
    describe '#create' do
      context '商品が出品できるとき' do
        it "priceが300ちょうどだと登録できる" do
          @item.price =  "300"
          expect(@item).to be_valid
        end   
 
        it "priceが9999999だと登録できる" do
          @item.price = "9999999"
          expect(@item).to be_valid
        end

        it "必須項目が全てあれば登録できること" do
          expect(@item).to be_valid
        end
      end

      context '商品が出品できないとき' do
        it "nameがない場合は登録できないこと" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "descriptionがない場合は登録できないこと" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        
        it "category_idがない場合は登録できないこと" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end
        
        it "shipping_cost_idがない場合は登録できないこと" do
          @item.shipping_cost_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost is not a number")
        end
        
        it "prefecture_idがない場合は登録できないこと" do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number")
        end
        
        it "shipping_day_idがない場合は登録できないこと" do
          @item.shipping_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day is not a number")
        end

        it "priceがない場合は登録できないこと" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが299以下だと登録できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 299")
        end

        it "priceが10000000だと登録できないこと" do
          @item.price = "10000000"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
 
        it 'priceが半角数字でなければ登録できない' do
          @item.price = 'ぜんかく'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角数字でなければ登録できない' do
          @item.price = '１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角数字でなければ登録できない' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角数字でなければ登録できない' do
          @item.price = 'ゼンカク'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
  end
end