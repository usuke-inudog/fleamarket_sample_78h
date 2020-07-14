require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

    context 'ユーザー登録ができる' do

      it "必須項目が全て入力してある際は登録できる" do
        expect(build(:user)).to be_valid
      end

      it "passwordが7文字以上であれば登録できる" do
        user = build(:user, password: "passwor", password_confirmation: "passwor")
        expect(user).to be_valid
      end

      it "passwordが128文字以内であれば登録できる" do
        user = build(:user, password: "p" * 128, password_confirmation: "p" * 128)
        expect(user).to be_valid
      end

    end
  
    context 'ユーザー登録ができない' do

      it "nicknameの入力がない場合は登録できない" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "nicknameが重複していたら登録できない" do 
        user1 = create(:user,nickname: "taro")
        expect(build(:user, nickname: user1.nickname)).to_not be_valid
      end

      it "emailの入力がない場合は登録できない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "emailが重複していたら登録できない" do 
        user1 = create(:user,nickname: "taro", email: "taro@example.com")
        expect(build(:user, nickname: "jiro", email: user1.email)).to_not be_valid
      end

      it "emailに@とドメインがない場合は登録できない" do
        user = build(:user, email:"kkkgmail")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
  
      it "emailに@がない場合は登録できない" do
        user = build(:user, email:"kkkgmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
  
      it "emailにドメインがない場合は登録できない" do
        user = build(:user, email:"kkkgmail@")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "パスワードがなければ登録できない" do 
        expect(build(:user, password: nil)).to_not be_valid 
      end 

      it "passwordとpassword_confirmationが異なる場合登録できない" do 
        expect(build(:user, password: "pass012", password_confirmation: "pass013")).to_not be_valid
      end

      it "passwordが7文字未満であれば登録できない" do
        user = build(:user, password: "passwo", password_confirmation: "passwo")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it "passwordが128文字超であれば登録できない" do
        user = build(:user, password: "p" * 129, password_confirmation: "p" * 129)
        user.valid?
        expect(user.errors[:password]).to include("は128文字以内で入力してください")
      end

    end

    context 'ユーザー登録の確認事項' do

      it "passwordが暗号化されているか" do 
        user = build(:user)
        expect(user.encrypted_password).to_not eq "password"
      end

    end
    
  end
end
