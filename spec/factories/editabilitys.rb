FactoryBot.define do
  factory :editability do
    e_id { 1 }
    activate { "MyString" }
    deactivate { "MyString" }
    add_new_ques { 1 }
    add_option { 4 }
  end
end
