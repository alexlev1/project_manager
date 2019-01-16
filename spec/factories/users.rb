FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name "Alexander"
    last_name "Levashov"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "dotenv123"
  end
end
