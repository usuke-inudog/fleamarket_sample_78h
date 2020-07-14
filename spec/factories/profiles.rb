FactoryBot.define do

  factory :profile do
    family_name       {"齋藤"}
    first_name        {"亮"}
    family_name_kana  {"さいとう"}
    first_name_kana   {"りょう"}
    birthday          {"1987-08-08"}
    introduction      {"よろしくお願いします！"}
    avatar            { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/iso.png'), 'spec/factories/iso.png') ] }
    user_id           {FactoryBot.create(:user).id}
  end

end
