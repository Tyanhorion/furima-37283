require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    
    it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kanaが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
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
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameは、全角であれば登録できる' do
      @user.last_name = "山田"
      expect(@user).to be_valid
    end
    it 'first_nameは、全角であれば登録できる' do
      @user.first_name = "太郎"
      expect(@user).to be_valid
    end
    it 'first_nameは、全角であれば登録できる' do
      @user.last_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end
    it 'first_nameは、全角であれば登録できる' do
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
  end
end
