FactoryBot.define do
  factory :attendance do
    #stripe_customer_id { "MyString" }

    user {FactoryBot.build(:user)}

    event {FactoryBot.build(:event)}
  end
end
