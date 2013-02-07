class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  belongs_to :status
  belongs_to :tag, :class_name => "User", :foreign_key => "tag_id"
  # belongs_to :user_name, :class_name => "User", :foreign_key => "user_id"
  acts_as_taggable
  has_many :notifications, :as => :notifiable
  has_many :attachments, :as => :attachmentable
  belongs_to :tagged, :class_name => "User", :foreign_key => "tag_id"
  attr_accessible :description, :tag_list, :title, :user_id, :attachments_attributes,:tag_id, :confirmation, :status_id
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notifications, allow_destroy: true
  validates_presence_of :title
  scope :user_writer, lambda{|params| where(:user_id => params)}
  scope :pending_request, lambda{|params| where("user_id = '#{params}' and tag_id != '' and confirmation != 'true'")}
end
