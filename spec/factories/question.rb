FactoryBot.define do
  factory :question do
    sequence(:external_id) { |n| n }
    sequence(:title) { |n| "Question #{n}" }
    category "Test"
    option1 "Option 1"
    option2 "Option 2"
    option3 "Option 3"
    option4 "Option 4"
    answer "1"
  end
end