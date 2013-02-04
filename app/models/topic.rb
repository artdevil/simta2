class Topic < ActiveRecord::Base
  belongs_to :user
  # belongs_to :user_name, :class_name => "User", :foreign_key => "user_id"
  acts_as_taggable
  has_many :notifications, :as => :notifiable
  has_many :attachments, :as => :attachmentable
  attr_accessible :description, :tag_list, :title, :user_id, :attachments_attributes
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notifications, allow_destroy: true
  scope :user_writer, lambda{|params| where(:user_id => params)}
end
