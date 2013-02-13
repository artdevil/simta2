class TodoProposal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :attachments, :as => :attachmentable
  has_many :comments, :as => :commentable
  belongs_to :proposal
  belongs_to :lecture_todo_proposal, :class_name => "User", :foreign_key => "lecture_id"
  belongs_to :student_todo_proposal, :class_name => "User", :foreign_key => "student_id"
  belongs_to :create_todo_proposal, :class_name => "User", :foreign_key => "create_id"
  attr_accessible :description, :lecture_id, :proposal_id, :student_id, :title, :create_id, :attachments_attributes, :done
  validates_presence_of :lecture_id, :proposal_id, :student_id, :title, :create_id
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  
end
