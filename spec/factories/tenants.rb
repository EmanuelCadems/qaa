# This will guess the Tenant class
FactoryBot.define do
  factory :tenant do
    sequence(:name) { Faker::Name.name_with_middle }
    sequence(:api_key) { SecureRandom.urlsafe_base64 }
  end
end
