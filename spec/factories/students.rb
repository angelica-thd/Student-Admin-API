FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    id_number  'p12345'
    university 'University of Piraeus'
    dept 'Computer Science'
    user_id nil
  end
end
