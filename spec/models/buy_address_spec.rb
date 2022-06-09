require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の登録' do
    before do
      user = FactoryBot.create(:user)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id)
    end

    context '登録できる場合' do
      it 'postal_code, prefecture, municipalities, address, telephoneがあれば登録できる' do
        expect(@buy_address).to be_valid
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列だと登録できる' do
        @buy_address.postal_code = "123-4567"
        expect(@buy_address).to be_valid
      end
      it 'telephoneは0桁以上11桁以内の半角数値だと登録できる' do
        @buy_address.telephone = "09012345678"
        expect(@buy_address).to be_valid
      end

    end

    context '登録できない場合' do
      it 'postal_codeが空だと登録できない' do
        @buy_address.postal_code = ""
        # binding.pry
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureが空だと登録できない' do
        @buy_address.prefecture_id = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと登録できない' do
        @buy_address.municipalities = ""
        @buy_address.valid?

        expect(@buy_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @buy_address.address = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと登録できない' do
        @buy_address.telephone = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角数字列のみでないと登録できない' do
        @buy_address.postal_code = "1234567"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'telephoneは10桁以上11桁以内の半角数値のみでないと登録できない' do
        @buy_address.telephone = "090-1234-5678"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
      end
    end
  end
end

