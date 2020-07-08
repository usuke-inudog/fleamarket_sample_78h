require 'rails_helper'
describe  Item do
  describe  '#create' do
    it "is one imagefile attached a item" do
      item = Item.new(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't name blank")
    end
  end
end
