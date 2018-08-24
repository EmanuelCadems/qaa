# This will guess the Question class
FactoryBot.define do
  factory :question do
    association :asker, factory: :user
    sequence(:name) { Faker::Lorem.question }
    private { false }

    after :create do |question|
      rand(6).times { create(:answer, question: question) }
    end
  end
end
