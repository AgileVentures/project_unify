FactoryGirl.define do
  factory :user do
    user_name 'Random Guy'
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end
