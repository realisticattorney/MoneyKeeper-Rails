# spec/factories/records.rb
FactoryBot.define do
  factory :record do
    flow_direction { Faker::Lorem.word }
    pending { true } 
    savings { false }
    frequency { Faker::Lorem.word }
    time_span { Faker::Lorem.characters(number: 2) }
    category { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 15) }
    # user { create(:user) }
    account_id { nil }
  end
end