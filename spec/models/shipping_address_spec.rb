require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do

  describe '#create' do

    context 'shipping_address登録ができる' do

      it "必須項目が全て入力してある際は登録できる" do
        expect(build(:shipping_address)).to be_valid
      end

      it "building_numberが空でも登録できる" do
        shipping_address = build(:shipping_address, building_number: nil)
        expect(shipping_address).to be_valid
      end

      it "phone_numberが空でも登録できる" do
        shipping_address = build(:shipping_address, phone_number: nil)
        expect(shipping_address).to be_valid
      end

      it "phone_numberに-がついても登録できる" do
        shipping_address = build(:shipping_address, phone_number: 000-1111-2222)
        expect(shipping_address).to be_valid
      end

      it "phone_numberが何桁でも登録できる" do
        shipping_address = build(:shipping_address, phone_number: 0120444444)
        expect(shipping_address).to be_valid
      end
      
      it "shipping_family_nameが漢字で登録できる" do
        shipping_address = build(:shipping_address, shipping_family_name: "漢字")
        expect(shipping_address).to be_valid
      end

      it "shipping_family_nameがひらがなで登録できる" do
        shipping_address = build(:shipping_address, shipping_family_name: "ひらがな")
        expect(shipping_address).to be_valid
      end

      it "shipping_family_nameがカタカナで登録できる" do
        shipping_address = build(:shipping_address, shipping_family_name: "カタカナ")
        expect(shipping_address).to be_valid
      end

      it "shipping_first_nameが漢字で登録できる" do
        shipping_address = build(:shipping_address, shipping_first_name: "漢字")
        expect(shipping_address).to be_valid
      end

      it "shipping_first_nameがひらがなで登録できる" do
        shipping_address = build(:shipping_address, shipping_first_name: "ひらがな")
        expect(shipping_address).to be_valid
      end

      it "shipping_first_nameがカタカナで登録できる" do
        shipping_address = build(:shipping_address, shipping_first_name: "カタカナ")
        expect(shipping_address).to be_valid
      end

      it "shipping_family_name_kanaがひらがなで登録できる" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "ひらがな")
        expect(shipping_address).to be_valid
      end

      it "shipping_first_name_kanaがひらがなで登録できる" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "ひらがな")
        expect(shipping_address).to be_valid
      end

    end

    context 'shipping_address登録ができない(値の数パターン)' do

      it "postal_codeが7文字以外では登録できない" do
        shipping_address = build(:shipping_address, postal_code: 123-4567)
        shipping_address.valid?
        expect(shipping_address.errors[:postal_code]).to include("は7文字で入力してください")
      end

    end

    context 'shipping_address登録ができない(空パターン)' do

      it "shipping_family_nameが空では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("を入力してください")
      end

      it "shipping_first_nameが空では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("を入力してください")
      end

      it "shipping_family_name_kanaが空では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("を入力してください")
      end

      it "shipping_first_name_kanaが空では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("を入力してください")
      end

      it "postal_codeが空では登録できない" do
        shipping_address = build(:shipping_address, postal_code: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:postal_code]).to include("を入力してください")
      end

      it "state_provinceが空では登録できない" do
        shipping_address = build(:shipping_address, state_province: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:state_province]).to include("を入力してください")
      end

      it "cityが空では登録できない" do
        shipping_address = build(:shipping_address, city: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:city]).to include("を入力してください")
      end

      it "streetが空では登録できない" do
        shipping_address = build(:shipping_address, street: nil)
        shipping_address.valid?
        expect(shipping_address.errors[:street]).to include("を入力してください")
      end

    end

    context 'shipping_address登録ができない(全角半角パターン)' do

      it "shipping_family_nameが全角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "ＡＢＣ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが全角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "ａｂｃ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが半角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "ABC")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが半角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "abc")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが半角ｶﾀｶﾅでは登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "ｶﾀｶﾅ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが全角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "１２３")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_family_nameが半角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name: "123")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが全角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "ＡＢＣ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが全角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "ａｂｃ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが半角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "ABC")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが半角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "abc")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが半角ｶﾀｶﾅでは登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "ｶﾀｶﾅ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが全角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "１２３")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_first_nameが半角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name: "123")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name]).to include("は不正な値です")
      end

      it "shipping_family_name_kanaが漢字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "漢字")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end

      it "shipping_family_name_kanaが全角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "ＡＢＣ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが全角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "ａｂｃ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが半角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "ABC")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが半角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "abc")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end

      it "shipping_family_name_kanaが全角カタカナでは登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "カタカナ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "ｶﾀｶﾅ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが全角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "１２３")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_family_name_kanaが半角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_family_name_kana: "123")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_family_name_kana]).to include("は不正な値です")
      end

      it "shipping_first_name_kanaが漢字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "漢字")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end

      it "shipping_first_name_kanaが全角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "ＡＢＣ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが全角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "ａｂｃ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが半角英大文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "ABC")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが半角英小文字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "abc")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end

      it "shipping_first_name_kanaが全角カタカナでは登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "カタカナ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "ｶﾀｶﾅ")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが全角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "１２３")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end
      
      it "shipping_first_name_kanaが半角数字では登録できない" do
        shipping_address = build(:shipping_address, shipping_first_name_kana: "123")
        shipping_address.valid?
        expect(shipping_address.errors[:shipping_first_name_kana]).to include("は不正な値です")
      end

    end

  end
end
