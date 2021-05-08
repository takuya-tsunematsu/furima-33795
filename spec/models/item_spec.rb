require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'nameとprice、textとcategory_id、status_idとdelivery_charge_id、prefecture_idとshipping_date_idがあれば商品出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品名がないと出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明がないと出品できない' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'カテゴリーを選択しないと出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it '商品の状態を選択しないと出品できない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Status Select"
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge Select"
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date Select"
      end
      it '販売価格を入力しないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '商品価格が299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '商品価格が10_000_000円以上では出品できない' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '商品価格が半角英数字混合では出品できない' do
        @item.price = "aaa000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it '商品価格が全角文字では出品できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end 
      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'カテゴリーのidに1が選択されていれば出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it '商品の状態のidに1が選択されていれば出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status Select"
      end
      it '配送料の負担のidに1が選択されていれば出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge Select"
      end
      it '発送元の地域のidに1が選択されていれば出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture Select"
      end
      it '発送までの日数のidに1が選択されていれば出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date Select"
      end
    end
  end
end