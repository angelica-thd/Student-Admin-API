FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    id_number { Faker::Internet.username(specifier: 5)  }
    university 'University of Piraeus'
    department 'Computer Science'
  end
end
