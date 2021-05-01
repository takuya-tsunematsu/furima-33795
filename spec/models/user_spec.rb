require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do 
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password Include both letters and numbers", "Password confirmation doesn't match Password"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'emailが@を含まないと登録できない' do
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'パスワードが半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
      end
      it 'last_nameがなければ登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameがなければ登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが全角で入力しなければ登録できない' do
        @user.last_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_nameが全角で入力しなければ登録できない' do
        @user.first_name = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana Full-width katakana characters"
      end
      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
      end
      it 'last_name_kanaがなければ登録できないこと' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaがなければ登録できないこと' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '生年月日がなければとうろくできないこと' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end