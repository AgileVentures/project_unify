FactoryGirl.define do
  factory :user do
    user_name 'Random Guy'
    email { Faker.email}
  end
end
