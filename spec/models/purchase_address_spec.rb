require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture,city,house_number,phone_numberがあれば購入できる' do 
        expect(@purchase_address).to be_valid
      end
    end
  end

  context '商品購入できないとき' do
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
      binding.pry
      expect(@purchase_address.errors.full_messages).to include "Phone number Input only number"
    end
  end
end
