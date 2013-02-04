class Attachment < ActiveRecord::Base
  belongs_to :attachmentable, :polymorphic => true
  attr_accessible :attachmentable_type, :attachment_name, :attachmentable_id
  validates_presence_of :attachment_name
  mount_uploader :attachment_name, AttachmentUploader
end
