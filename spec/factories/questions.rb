FactoryBot.define do
  factory :question do
    ques_no { 1 }
    first_option { "MyString" }
    second_option { "MyString" }
    third_option { "MyString" }
    fourth_option { "MyString" }
    answer { "MyString" }
    time_limit { 1 }
  end
end
