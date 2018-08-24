# This will guess the Answer class
FactoryBot.define do
  factory :answer do
    association :question
    association :provider, factory: :user
    sequence(:name) { Faker::Lorem.paragraph }
  end
end
