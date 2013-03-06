# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_config do
    max_lecture_student_proposal 1
    max_lecture_student_scription 1
  end
end
