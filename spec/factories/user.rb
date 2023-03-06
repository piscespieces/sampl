FactoryBot.define do
  factory :user do
    email { "user@user.com" }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end