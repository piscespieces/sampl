FactoryBot.define do
  factory :user do
    name { "User" }
    admin { false }
    email { "user@user.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end

  factory :admin, class: "User" do
    name { "User" }
    admin { true }
    email { "admin@admin.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end