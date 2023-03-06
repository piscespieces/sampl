FactoryBot.define do
  factory :artist do
    email { "artist@artist.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end
