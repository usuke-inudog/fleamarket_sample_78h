require 'rails_helper'

RSpec.describe Item, type: :model, do: true do
  describe '#create' do

    context '商品を登録できる' do

      it "必須項目が全て入力してある際は登録できる" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "商品名の入力があれば登録できる" do
        item = build(:item, name: create(:item).name)
        expect(item).to be_valid
      end

      it "商品名が40文字以内であれば登録できる" do
        item = build(:item, name: "あ" * 40 )
        expect(item).to be_valid
      end

      it "商品説明の入力があれば登録できる" do
        item = build(:item, introduction: create(:item).introduction)
        expect(item).to be_valid
      end

      it "商品説明が1000文字以内であれば登録できる" do
        item = build(:item, introduction: "あ" * 1000 )
        expect(item).to be_valid
      end

      it "カテゴリーの入力があれば登録できる" do
        item = build(:item, category_id: create(:category).id)
        expect(item).to be_valid
      end

      it "ブランドの入力があれば登録できる" do
        item = build(:item, brand_id: create(:brand).id)
        expect(item).to be_valid
      end

      it "商品の状態の入力があれば登録できる" do
        item = build(:item, item_condition: create(:item).item_condition)
        expect(item).to be_valid
      end

      it "サイズの入力があれば登録できる" do
        item = build(:item, size: "M")
        expect(item).to be_valid
      end
  
      it "配送料の負担の入力があれば登録できる" do
        item = build(:item, delivery_burden: create(:item).delivery_burden)
        expect(item).to be_valid
      end
      
      it "配送方法の入力があれば登録できる" do
        item = build(:item, delivery_method: create(:item).delivery_method)
        expect(item).to be_valid
      end

      it "発送元の地域の入力があれば登録できる" do
        item = build(:item, shipper: create(:item).shipper)
        expect(item).to be_valid
      end

      it "発送までの日数の入力があれば登録できる" do
        item = build(:item, shipping_day: create(:item).shipping_day)
        expect(item).to be_valid
      end

      it "販売価格の入力があれば登録できる" do
        item = build(:item, price: create(:item).price)
        expect(item).to be_valid
      end

      it "販売価格が300円以上であれば登録できる" do
        item = build(:item, price: 300 )
        expect(item).to be_valid
      end

      it "販売価格が9,999,999円以内であれば登録できる" do
        item = build(:item, price: 9999999 )
        expect(item).to be_valid
      end

    end

    context '商品を登録できない' do

      it "商品名の入力がない場合は登録できない" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "商品名が40文字超であれば登録できない" do
        item = build(:item, name: "あ" * 41 )
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      it "商品説明の入力がない場合は登録できない" do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it "商品説明が1000文字超であれば登録できない" do
        item = build(:item, introduction: "あ" * 1001 )
        item.valid?
        expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
      end

      it "カテゴリーの入力がない場合は登録できない" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it "商品の状態の入力がない場合は登録できない" do
        item = build(:item, item_condition: nil)
        item.valid?
        expect(item.errors[:item_condition]).to include("を入力してください")
      end

      it "配送料の負担の入力がない場合は登録できない" do
        item = build(:item, delivery_burden: nil)
        item.valid?
        expect(item.errors[:delivery_burden]).to include("を入力してください")
      end

      it "配送料の負担の入力がない場合は登録できない" do
        item = build(:item, delivery_method: nil)
        item.valid?
        expect(item.errors[:delivery_method]).to include("を入力してください")
      end

      it "発送元の地域の入力がない場合は登録できない" do
        item = build(:item, shipper: nil)
        item.valid?
        expect(item.errors[:shipper]).to include("を入力してください")
      end

      it "発送までの日数の入力がない場合は登録できない" do
        item = build(:item, shipping_day: nil)
        item.valid?
        expect(item.errors[:shipping_day]).to include("を入力してください")
      end

      it "販売価格の入力がない場合は登録できない" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "販売価格が300円未満であれば登録できない" do
        item = build(:item, price: 299 )
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "販売価格が9,999,999円超であれば登録できない" do
        item = build(:item, price: 10000000 )
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end
      
    end

  end
end
