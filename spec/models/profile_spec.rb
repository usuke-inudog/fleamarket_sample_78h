require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#create' do

    context 'profile登録ができる' do

      it "必須項目が全て入力してある際は登録できる" do
        expect(build(:profile)).to be_valid
      end

      it "introductionが空でも登録できる" do
        profile = build(:profile, introduction: nil)
        expect(profile).to be_valid
      end

      it "avaterが空でも登録できる" do
        profile = build(:profile, avatar: nil)
        expect(profile).to be_valid
      end
      
      it "family_nameが漢字で登録できる" do
        profile = build(:profile, family_name: "漢字")
        expect(profile).to be_valid
      end

      it "family_nameがひらがなで登録できる" do
        profile = build(:profile, family_name: "ひらがな")
        expect(profile).to be_valid
      end

      it "family_nameがカタカナで登録できる" do
        profile = build(:profile, family_name: "カタカナ")
        expect(profile).to be_valid
      end

      it "first_nameが漢字で登録できる" do
        profile = build(:profile, first_name: "漢字")
        expect(profile).to be_valid
      end

      it "first_nameがひらがなで登録できる" do
        profile = build(:profile, first_name: "ひらがな")
        expect(profile).to be_valid
      end

      it "first_nameがカタカナで登録できる" do
        profile = build(:profile, first_name: "カタカナ")
        expect(profile).to be_valid
      end

      it "family_name_kanaがひらがなで登録できる" do
        profile = build(:profile, family_name_kana: "ひらがな")
        expect(profile).to be_valid
      end

      it "first_name_kanaがひらがなで登録できる" do
        profile = build(:profile, first_name_kana: "ひらがな")
        expect(profile).to be_valid
      end

    end

    context 'profile登録ができない(空パターン)' do

      it "family_nameが空では登録できない" do
        profile = build(:profile, family_name: nil)
        profile.valid?
        expect(profile.errors[:family_name]).to include("を入力してください")
      end

      it "first_nameが空では登録できない" do
        profile = build(:profile, first_name: nil)
        profile.valid?
        expect(profile.errors[:first_name]).to include("を入力してください")
      end

      it "family_name_kanaが空では登録できない" do
        profile = build(:profile, family_name_kana: nil)
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("を入力してください")
      end

      it "first_name_kanaが空では登録できない" do
        profile = build(:profile, first_name_kana: nil)
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("を入力してください")
      end

      it "birthdayが空では登録できない" do
        profile = build(:profile, birthday: nil)
        profile.valid?
        expect(profile.errors[:birthday]).to include("を入力してください")
      end
    end

    context 'profile登録ができない(全角半角パターン)' do

      it "family_nameが全角英大文字では登録できない" do
        profile = build(:profile, family_name: "ＡＢＣ")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが全角英小文字では登録できない" do
        profile = build(:profile, family_name: "ａｂｃ")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが半角英大文字では登録できない" do
        profile = build(:profile, family_name: "ABC")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが半角英小文字では登録できない" do
        profile = build(:profile, family_name: "abc")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが半角ｶﾀｶﾅでは登録できない" do
        profile = build(:profile, family_name: "ｶﾀｶﾅ")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが全角数字では登録できない" do
        profile = build(:profile, family_name: "１２３")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "family_nameが半角数字では登録できない" do
        profile = build(:profile, family_name: "123")
        profile.valid?
        expect(profile.errors[:family_name]).to include("は不正な値です")
      end

      it "first_nameが全角英大文字では登録できない" do
        profile = build(:profile, first_name: "ＡＢＣ")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが全角英小文字では登録できない" do
        profile = build(:profile, first_name: "ａｂｃ")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが半角英大文字では登録できない" do
        profile = build(:profile, first_name: "ABC")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが半角英小文字では登録できない" do
        profile = build(:profile, first_name: "abc")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが半角ｶﾀｶﾅでは登録できない" do
        profile = build(:profile, first_name: "ｶﾀｶﾅ")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが全角数字では登録できない" do
        profile = build(:profile, first_name: "１２３")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "first_nameが半角数字では登録できない" do
        profile = build(:profile, first_name: "123")
        profile.valid?
        expect(profile.errors[:first_name]).to include("は不正な値です")
      end

      it "family_name_kanaが漢字では登録できない" do
        profile = build(:profile, family_name_kana: "漢字")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end

      it "family_name_kanaが全角英大文字では登録できない" do
        profile = build(:profile, family_name_kana: "ＡＢＣ")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが全角英小文字では登録できない" do
        profile = build(:profile, family_name_kana: "ａｂｃ")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが半角英大文字では登録できない" do
        profile = build(:profile, family_name_kana: "ABC")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが半角英小文字では登録できない" do
        profile = build(:profile, family_name_kana: "abc")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end

      it "family_name_kanaが全角カタカナでは登録できない" do
        profile = build(:profile, family_name_kana: "カタカナ")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        profile = build(:profile, family_name_kana: "ｶﾀｶﾅ")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが全角数字では登録できない" do
        profile = build(:profile, family_name_kana: "１２３")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end
      
      it "family_name_kanaが半角数字では登録できない" do
        profile = build(:profile, family_name_kana: "123")
        profile.valid?
        expect(profile.errors[:family_name_kana]).to include("は不正な値です")
      end

      it "first_name_kanaが漢字では登録できない" do
        profile = build(:profile, first_name_kana: "漢字")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end

      it "first_name_kanaが全角英大文字では登録できない" do
        profile = build(:profile, first_name_kana: "ＡＢＣ")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが全角英小文字では登録できない" do
        profile = build(:profile, first_name_kana: "ａｂｃ")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが半角英大文字では登録できない" do
        profile = build(:profile, first_name_kana: "ABC")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが半角英小文字では登録できない" do
        profile = build(:profile, first_name_kana: "abc")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end

      it "first_name_kanaが全角カタカナでは登録できない" do
        profile = build(:profile, first_name_kana: "カタカナ")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが半角ｶﾀｶﾅでは登録できない" do
        profile = build(:profile, first_name_kana: "ｶﾀｶﾅ")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが全角数字では登録できない" do
        profile = build(:profile, first_name_kana: "１２３")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end
      
      it "first_name_kanaが半角数字では登録できない" do
        profile = build(:profile, first_name_kana: "123")
        profile.valid?
        expect(profile.errors[:first_name_kana]).to include("は不正な値です")
      end

    end

  end
end
