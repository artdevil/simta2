# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    sender_id 1
    receiver_id 1
    notifiable_id 1
     ""
    notification_id 1
    notification_status "MyString"
  end
end
