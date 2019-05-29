FactoryBot.define do
  factory :event do

    start_date {Faker::Time.forward(23, :morning)}
    duration { 30 }
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
    price {rand(1..1000)}
    location {Faker::LordOfTheRings.location}
    admin {FactoryBot.build(:user)}
  end
end
