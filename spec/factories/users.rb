FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: 5) }
    email "user@mail.com"
    password 'boo'
  end
end
