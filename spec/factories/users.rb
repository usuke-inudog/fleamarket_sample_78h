FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 7, max_length: 128)
    sequence(:nickname)   {Faker::Name.name}
    sequence(:email)      {Faker::Internet.email}
    password              {password}
    password_confirmation {password}
  end

end
