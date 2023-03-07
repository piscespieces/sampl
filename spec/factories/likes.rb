FactoryBot.define do
  factory :like do
    association :user
    association :sample
  end
end
