# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposal do
    student_id 1
    lecture_id 1
    topic_id 1
    progress "MyString"
  end
end
