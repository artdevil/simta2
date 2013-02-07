class Comment < ActiveRecord::Base
  has_many :attachments, :as => :attachmentable
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  attr_accessible :comment, :commentable_id, :commentable_type, :user_id, :attachments_attributes
  accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes[:attachment_name].blank? }, allow_destroy: true
  validates_presence_of :comment
end
