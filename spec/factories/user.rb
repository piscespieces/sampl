FactoryBot.define do
  factory :user do
    name { "User" }
    artist { false }
    email { "user@user.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end

  factory :artist, class: "User" do
    name { "User" }
    artist { true }
    email { "admin@admin.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end