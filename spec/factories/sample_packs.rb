FactoryBot.define do
  factory :sample_pack do
    name { "My First Sample Pack" }
    association :artist
  end
end
