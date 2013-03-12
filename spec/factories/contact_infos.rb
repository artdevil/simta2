# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_info do
    user_info_id 1
    contact_type "MyString"
    contact_info "MyString"
  end
end
