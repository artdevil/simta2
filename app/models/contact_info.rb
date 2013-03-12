class ContactInfo < ActiveRecord::Base
  belongs_to :user_info
  attr_accessible :contact_info, :contact_type, :user_info_id
end
