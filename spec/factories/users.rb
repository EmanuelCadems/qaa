# This will guess the User class
FactoryBot.define do
  factory :user do
    sequence(:name) { Faker::Name.name_with_middle }

    trait :provider do
      name { 'Provider' }
    end

    trait :asker do
      name { 'Asker' }
    end
  end
end
