# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo_proposal do
    proposal_id 1
    student_id 1
    lecture_id 1
    title "MyString"
    description "MyText"
  end
end
