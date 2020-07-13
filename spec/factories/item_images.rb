FactoryBot.define do
  
  factory :item_image do
    image { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/iso.png'), 'spec/factories/iso.png') ] }
    item_id {FactoryBot.create(:item).id}
  end

end
