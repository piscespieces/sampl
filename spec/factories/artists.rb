FactoryBot.define do
  factory :artist do
    name { "Devastador" }
    email { "artist@artist.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end
