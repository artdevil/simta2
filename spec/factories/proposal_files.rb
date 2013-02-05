# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proposal_file do
    proposal_id 1
    title "MyString"
    file "MyString"
    note "MyText"
  end
end
