require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
    @purchase_address.user_id = FactoryBot.create(:user)
    @purchase_address.item_id = FactoryBot.create(:item)
    sleep(2)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture,city,house_number,phone_numberがあれば購入できる' do 
        expect(@purchase_address).to be_valid
      end
    end
    it '建物名が抜けていても登録できること' do
      @purchase_address.building_name = ""
      expect(@purchase_address).to be_valid
    end
  end

  context '商品購入できないとき' do
    it 'card_tokenがないと購入できない' do
      @purchase_address.card_token = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Card token can't be blank"
    end
    it 'postal_codeがないと購入できない' do
      @purchase_address.postal_code =""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
    end
    it 'postal_codeにハイフンがないと購入できない'do
      @purchase_address.postal_code ="111111"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
    end
    it 'prefecture_idがないと購入できない' do
      @purchase_address.prefecture_id =""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture Select"
    end
    it 'prefecture_idが1では登録できない' do
      @purchase_address.prefecture_id = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture Select"
    end
    it 'cityがないと購入できない' do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end
    it 'house_numberがないと購入できない' do
      @purchase_address.house_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
    end
    it 'phone_numberがないと購入できない' do
      @purchase_address.phone_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
    end
    it 'phone_numberが12文字以上では購入できない' do
      @purchase_address.phone_number = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number Input only number"
    end
    it 'phone_numberが文字では購入できない' do
      @purchase_address.phone_number = "あああああああああああ"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number Input only number"
    end
    it 'phone_numberが英数混合では登録できない' do
      @purchase_address.phone_number = "090asdf7890"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number Input only number"
    end
    it 'user_idが空の場合は購入できない' do
      @purchase_address.user_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "User can't be blank"
    end
    it 'item_idが空では購入できない' do
      @purchase_address.item_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Item can't be blank"
    end
  end
end