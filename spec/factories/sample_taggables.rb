FactoryBot.define do
  factory :sample_taggable do
    association :sample
    association :sample_tag
  end
end
