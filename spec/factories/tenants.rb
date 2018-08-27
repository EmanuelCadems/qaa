# This will guess the Tenant class
FactoryBot.define do
  factory :tenant do
    sequence(:name) { Faker::Name.name_with_middle }
  end
end
