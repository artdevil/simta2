class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable
  
  belongs_to :lecture_topic, :class_name => "User", :foreign_key => "lecture_id"
  belongs_to :topic_status
  belongs_to :tag, :class_name => "User", :foreign_key => "tag_id"
  # belongs_to :user_name, :class_name => "User", :foreign_key => "user_id"
  has_one :proposal
  has_many :notifications, :as => :notifiable
  has_many :attachments, :as => :attachmentable
  belongs_to :tagged, :class_name => "User", :foreign_key => "tag_id"
  attr_accessible :description, :proposal_attributes, :tag_list, :title, :lecture_id, :attachments_attributes,:tag_id, :confirmation, :topic_status_id
  
  validates_presence_of :title
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notifications, allow_destroy: true
  accepts_nested_attributes_for :proposal, :reject_if => proc { |attributes| attributes[:student_id].blank? and attributes[:lecture_id].blank?}, allow_destroy: true
  
  
  scope :user_writer, lambda{|params| where(:lecture_id => params)}
  scope :pending_request, lambda{|params| where("lecture_id = '#{params}' and tag_id != '' and confirmation != true")}
end
