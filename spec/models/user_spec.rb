require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'password,password_confirmationが６文字以上であれば登録できる' do
      @user.password = 'abc000000'
      @user.password_confirmation = 'abc000000'
      expect(@user).to be_valid
    end
    
    it 'nicknameと,email,password,password_confimation,family_name,first_name,family_name_kana,first_name_kana,birth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation ='00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'emailが@を含んでいなければ登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordとpassword_confirmationの値が一致していなければ登録できない' do
      @user.password = 'test000000'
      @user.password_confirmation = 'test111111'
    end
    it 'passwordが半角英数字混合出なければ登録できない' do
      @user.password = 'aaaaaa'
      @user.password = '111111'
      @user.password = 'ぜんかく'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'family_name全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
      @user.family_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_nameが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_name_kanaが全角(カタカナ)でなければ登録できない' do
      @user.family_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'first_name_kanaが全角(カタカナ)でなければ登録できない' do
      @user.first_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end
