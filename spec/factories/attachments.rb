# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    attachment_name "MyString"
    attachmentable_id 1
    attachemtable_type "MyString"
  end
end
