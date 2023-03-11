FactoryBot.define do
  factory :sample_pack do
    name { "My First Sample Pack" }
    association :user
  end
end
