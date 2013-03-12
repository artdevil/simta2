class UserInfo < ActiveRecord::Base
  belongs_to :user
  has_many :contact_infos
  attr_accessible :birthday, :gender, :user_id, :religion
end
