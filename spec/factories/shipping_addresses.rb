FactoryBot.define do

  factory :shipping_address do
    shipping_family_name      {"齋藤"}
    shipping_first_name       {"亮"}
    shipping_family_name_kana {"さいとう"}
    shipping_first_name_kana  {"りょう"}
    postal_code               {1234567}
    state_province            {Faker::Address.state}
    city                      {Faker::Address.city}
    street                    {Faker::Address.street_address}
    building_number           {Faker::Address.building_number}
    phone_number              {Faker::PhoneNumber.phone_number}
    user_id                   {FactoryBot.create(:user).id}
  end

end
