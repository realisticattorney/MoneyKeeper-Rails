FactoryBot.define do
  factory :account do
    # user { create(:user) }
    created_by { Faker::Number.number(digits: 10) }
  end
end
