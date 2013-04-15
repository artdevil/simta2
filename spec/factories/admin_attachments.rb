# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_attachment do
    attachment_name "MyString"
    admin_attachmentable_type "MyString"
    admin_attachmentable_id 1
  end
end
