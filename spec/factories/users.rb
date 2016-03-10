FactoryGirl.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    mentor false
    private false
  end
end
