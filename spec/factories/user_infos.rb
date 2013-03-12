# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_info do
    user_id 1
    birthday "2013-03-10"
    gender "MyString"
  end
end
