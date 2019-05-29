FactoryBot.define do
  factory :user do

    email {Faker::Internet.email}
   #encrypted_password { "MyString" }
    description {Faker::Lorem.paragraph}
    first_name { Faker::LordOfTheRings.character}
    last_name { Faker::Name.last_name}
  end
end
