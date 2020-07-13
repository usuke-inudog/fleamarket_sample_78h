require 'rails_helper'

RSpec.describe ItemImage, type: :model, do: true do
  let(:image_path) { Rails.root.join('spec/factories/iso.png') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe '#create' do
    context '画像を登録できる' do

      it "必須項目が全て入力してある際は登録できる" do
        item_image = build(:item_image)
        expect(item_image).to be_valid
      end

      it "画像を選択した際は登録できる" do
        item_image = build(:item_image, image: [image])
        expect(item_image).to be_valid
      end

      it "画像を2枚選択した際も登録できる" do
        item_image = build(:item_image, image: [image, image])
        expect(item_image).to be_valid
      end

      it "画像を3枚選択した際も登録できる" do
        item_image = build(:item_image, image: [image, image, image])
        expect(item_image).to be_valid
      end

      it "画像を4枚選択した際も登録できる" do
        item_image = build(:item_image, image: [image, image, image, image])
        expect(item_image).to be_valid
      end

    end

    context '画像を登録できない' do

      it "画像の選択がない際は登録できない" do
        item_image = build(:item_image, image: nil)
        item_image.valid?
        expect(item_image.errors[:image]).to include("can't be blank")
      end

    end
  end
end
