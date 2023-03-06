FactoryBot.define do
  factory :sample do
    name { "Spanish Guitar" }
    key { "C" }
    bpm { 120 }
    association :sample_pack
  end
end
