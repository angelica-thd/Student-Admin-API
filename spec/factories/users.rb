FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5) }
    email { Faker::Internet.email }
    password 'boo'
  end
end
