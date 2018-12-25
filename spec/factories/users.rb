FactoryBot.define do
  factory :user do
    user_name { "MyString" }
    password { 1235464321 }
    password_confirmation { 1235464321 }
    role { "MyString" }
  end
end
